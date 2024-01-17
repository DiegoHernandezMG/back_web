import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Card } from "primereact/card";
import { Button } from "primereact/button";
import { InputText } from "primereact/inputtext";
import Spinner from "./Spinner";

const title = (
  <div className="flex justify-content-center text-red-700 text-center">
    <h1>
      <i className="pi pi-angle-double-left" style={{ fontSize: "2rem" }}></i>{" "}
      Distinciones al Mérito Politécnico{" "}
      <i className="pi pi-angle-double-right" style={{ fontSize: "2rem" }}></i>
    </h1>
  </div>
);

const subtitle = (
  <div className="flex justify-content-center text-center pr-8 pl-8 font-italic">
    <h2 className="text-blue-700">
      "La diferencia entre una persona exitosa y los demás no es la falta de
      fuerza, ni la falta de conocimiento, sino más bien en la falta de
      voluntad." - Vince Lombardi
    </h2>
  </div>
);

function Bienvenida() {
  const [curp, setCurp] = useState("");
  const [invalid, setInvalid] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();

  const handleCurp = async () => {
    if (!curp.length) {
      return setInvalid(true);
    }

    setIsLoading(true);
    const url = "http://localhost/back/curp_api.php?curp=" + curp;
    const resp = await fetch(url);
    const user = await resp.json();
    setIsLoading(false);
    if (user.success) {
      navigate(`/ceremonia/${user.data.ID}`);
    } else {
      setInvalid(true);
    }
  };

  const handleInput = (e) => {
    setInvalid(false);
    setCurp(e.target.value);
  };

  //   className={`${styles.form} ${isLoading ? styles.loading : ""}`}
  const footer = (
    <>
      <div className="flex justify-content-center mt-6">
        {isLoading ? (
          <Spinner />
        ) : (
          <>
            <span className="p-float-label">
              <InputText
                className={`${invalid ? "p-invalid" : ""}`}
                id="username"
                value={curp}
                onChange={(e) => handleInput(e)}
              />
              <label htmlFor="username">CURP</label>
            </span>
            <Button
              label="Enviar"
              className="bg-red-700 hover:bg-red-400 border-red-700 ml-2"
              icon="pi pi-check"
              onClick={() => handleCurp()}
            />
          </>
        )}

        {/* <Button
          label="Cancel"
          severity="secondary"
          icon="pi pi-times"
          style={{ marginLeft: "0.5em" }}
        /> */}
      </div>
      {invalid && (
        <p className={"flex justify-content-center mt-4 text-red-500"}>
          Por favor ingresa una CURP válida!!!
        </p>
      )}
    </>
  );

  return (
    <div className="card flex justify-content-center m-5">
      <Card
        title={title}
        subTitle={subtitle}
        footer={footer}
        className="bg-bluegray-50"
      >
        <div className="mt-8 pr-8 pl-8 font-semibold text-lg ">
          <p className="font-bold text-center">
            ¡Bienvenido miembro de la comunidad!
          </p>
          <p>
            Es con inmenso orgullo y gran expectación que anunciamos nuestra
            próxima ceremonia de reconocimiento, un evento diseñado para honrar
            y celebrar las extraordinarias contribuciones de nuestros miembros
            más sobresalientes. Si tu dedicación y logros te han colocado entre
            este distinguido grupo, te invitamos cordialmente a formar parte de
            esta memorable ocasión.
          </p>
          <p>
            Por favor, asegura tu lugar en este evento único. Regístrate ahora y
            sé parte de la historia del Instituto Politécnico Nacional. ¡Nos
            vemos en la ceremonia!
          </p>
        </div>
      </Card>
    </div>
  );
}

export default Bienvenida;
