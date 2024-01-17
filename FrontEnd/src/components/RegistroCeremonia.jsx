import { Card } from "primereact/card";
import { useCallback, useEffect, useState } from "react";
import Spinner from "./Spinner";
import { Checkbox } from "primereact/checkbox";
import { InputText } from "primereact/inputtext";
import { Button } from "primereact/button";
import { useNavigate } from "react-router-dom";
import Pdf from "./Pdf";
import { PDFDownloadLink, PDFViewer } from "@react-pdf/renderer";
const title = (
  <div className="flex justify-content-center text-red-700 text-center">
    <h1>
      <i className="pi pi-angle-double-left" style={{ fontSize: "2rem" }}></i>{" "}
      Registro a la Ceremonia!{" "}
      <i className="pi pi-angle-double-right" style={{ fontSize: "2rem" }}></i>
    </h1>
  </div>
);

function RegistroCeremonia({ id }) {
  const [user, setUser] = useState({});
  const [isLoading, setLoading] = useState(true);
  const [checked1, setChecked1] = useState(false);
  const [checked2, setChecked2] = useState(false);
  const [invalid, setInvalid] = useState(false);
  const [acompaniante, setAcompaniante] = useState("");
  const [implemento, setImplemento] = useState("");

  const [dependencias, setDependencias] = useState([]);
  const [categorias, setCategorias] = useState([]);
  const [distinciones, setDistinciones] = useState([]);
  const [invitacion, setInvitacion] = useState({});
  const navigate = useNavigate();

  const getUser = useCallback(async (id) => {
    const url = "http://localhost/back/read_api_id.php?id=" + id;
    const url2 = "http://localhost/back/read_categoria.php";
    const url3 = "http://localhost/back/read_dependencia.php";
    const url4 = "http://localhost/back/read_distincion.php";

    let resp = await fetch(url);
    const userResp = await resp.json();
    console.log(userResp);
    setUser({ ...userResp });

    resp = await fetch(url2);
    const categoriasResp = await resp.json();
    const categorias = categoriasResp.data;
    setCategorias([...categorias]);
    console.log(categorias);

    resp = await fetch(url3);
    const dependenciasResp = await resp.json();
    const dependencias = dependenciasResp.data;
    setDependencias([...dependencias]);
    console.log(dependencias);

    resp = await fetch(url4);
    const distincionesResp = await resp.json();
    const distinciones = distincionesResp.data;
    setDistinciones([...distinciones]);
    console.log(distinciones);

    setLoading(false);
  }, []);

  useEffect(() => {
    getUser(id);
  }, [getUser, id]);

  useEffect(() => {
    if (!isLoading) {
      setInvitacion({
        title: "Invitación a ceremonia de reconocimiento",
        content: "Se le hace una cordial invitación a la ceremonia.",
        idUsuario: user.data.ID,
        asistenciaAcompaniante: user.data.ASISTENCIA_ACOMPANIANTE,
      });
    }
  }, [isLoading, user]);

  const handleInputAcompaniante = (e) => {
    setInvalid(false);
    setAcompaniante(e.target.value);
  };

  const handleInputImplemento = (e) => {
    setInvalid(false);
    setImplemento(e.target.value);
  };

  const handleRegistro = async () => {
    if (checked1) {
      if (!acompaniante.length) {
        return setInvalid(true);
      }
      if (checked2) {
        if (!implemento.length) {
          return setInvalid(true);
        }
      }
    }

    const u = user.data;
    const usuario1 = {
      id: u.ID,
      nombre: u.NOMBRE,
      dependencia: dependencias.filter(
        (e) => e.DEPENDENCIA === u.DEPENDENCIA
      )[0].ID_DEPENDENCIA,
      distincion: distinciones.filter((e) => e.DISTINCION === u.DISTINCION)[0]
        .ID_DISTINCION,
      categoria: categorias.filter((e) => e.CATEGORIA === u.CATEGORIA)[0]
        .ID_CATEGORIA,
      curp: u.CURP,
      asistencia: 1,
      asistenciaAcompaniante: checked1 ? 1 : 0,
      nombreAcompaniante: checked1 ? acompaniante : null,
      implemento: checked2 ? implemento : null,
    };

    const usuarioCopia = {
      ID: usuario1.id,
      NOMBRE: usuario1.nombre,
      DEPENDENCIA: u.DEPENDENCIA,
      DISTINCION: u.DISTINCION,
      CATEGORIA: u.CATEGORIA,
      CURP: usuario1.curp,
      ASISTENCIA: usuario1.asistencia,
      ASISTENCIA_ACOMPANIANTE: usuario1.asistenciaAcompaniante,
      NOMBRE_ACOMPANIANTE: usuario1.nombreAcompaniante,
      IMPLEMENTO: usuario1.implemento,
    };

    const userUpdate = JSON.stringify(usuario1);

    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");

    var requestOptions = {
      method: "PUT",
      headers: myHeaders,
      body: userUpdate,
      redirect: "follow",
    };
    setLoading(true);
    await fetch("http://localhost/back/update_api.php", requestOptions);
    setLoading(false);
    setUser({ ...user, data: { ...usuarioCopia } });
  };

  const footer = (
    <>
      {!isLoading && user.data.ASISTENCIA ? (
        <div className="card flex justify-content-center mt-5">
          <PDFDownloadLink
            document={<Pdf invitacion={invitacion} />}
            fileName="invitacion.pdf"
          >
            <Button>Descargar Invitación</Button>
          </PDFDownloadLink>
        </div>
      ) : (
        <>
          <div className="grid">
            <div className="col-6 lg:col-6">
              <div className="flex flex-wrap justify-content-center">
                <div className="flex align-items-center">
                  <Checkbox
                    inputId="acompaniante"
                    onChange={(e) => {
                      setChecked1(e.checked);
                    }}
                    checked={checked1}
                  ></Checkbox>
                  <label htmlFor="acompaniante" className="ml-2">
                    ¿Le acompañará alguien al evento?
                  </label>
                </div>
              </div>
            </div>
            {checked1 && (
              <>
                <div className="col-6 lg:col-6">
                  <div className="flex align-items-center ">
                    <span className="p-float-label">
                      <InputText
                        className={`${invalid ? "p-invalid" : ""}`}
                        id="username"
                        value={acompaniante}
                        onChange={(e) => handleInputAcompaniante(e)}
                      />
                      <label htmlFor="username">NOMBRE</label>
                    </span>
                  </div>
                </div>

                <div className="col-6 lg:col-6 mt-5">
                  <div className="flex flex-wrap justify-content-center">
                    <div className="flex align-items-center">
                      <Checkbox
                        inputId="acompaniante"
                        onChange={(e) => setChecked2(e.checked)}
                        checked={checked2}
                      ></Checkbox>
                      <label htmlFor="acompaniante" className="ml-2">
                        ¿Necesita algún implemento especial?
                      </label>
                    </div>
                  </div>
                </div>

                {checked2 && (
                  <div className="col-6 lg:col-6 mt-5">
                    <div className="flex align-items-center ">
                      <span className="p-float-label">
                        <InputText
                          className={`${invalid ? "p-invalid" : ""}`}
                          id="implemento"
                          value={implemento}
                          onChange={(e) => handleInputImplemento(e)}
                        />
                        <label htmlFor="implemento">IMPLEMENTO</label>
                      </span>
                    </div>
                  </div>
                )}
              </>
            )}
          </div>

          <div className="flex justify-content-center mt-6">
            <Button
              label="Registrarse"
              className="bg-red-700 hover:bg-red-400 border-red-700 ml-2"
              icon="pi pi-check"
              onClick={() => handleRegistro()}
            />
          </div>
          {invalid && (
            <p className={"flex justify-content-center mt-4 text-red-500"}>
              Por favor ingresa los datos completos!!!
            </p>
          )}
        </>
      )}
    </>
  );

  return (
    <>
      <div className="card flex justify-content-center mt-5">
        {isLoading ? (
          <Spinner />
        ) : (
          <>
            <Card title={title} footer={footer} className="bg-bluegray-50">
              <div className="mt-0 pr-8 pl-8 font-semibold text-lg ">
                <p className="font-bold text-center">
                  !! Hola {user.data["NOMBRE"]} !!
                </p>
                <p>ID : {user.data["ID"].toString()}</p>
                <p>Escuela : {user.data["DEPENDENCIA"].toString()}</p>
                <p>Categoría : {user.data["CATEGORIA"].toString()}</p>
                <p>
                  Distincion a recibir : {user.data["DISTINCION"].toString()}
                </p>
              </div>
            </Card>
          </>
        )}
      </div>
    </>
  );
}

export default RegistroCeremonia;
