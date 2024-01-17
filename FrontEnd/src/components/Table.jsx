import React, { useState, useEffect, useRef, useCallback } from "react";
import { classNames } from "primereact/utils";
import { DataTable } from "primereact/datatable";
import { Column } from "primereact/column";
import { ProductService } from "../service/ProductService";
import { Toast } from "primereact/toast";
import { Button } from "primereact/button";
import { FileUpload } from "primereact/fileupload";
import { Rating } from "primereact/rating";
import { Toolbar } from "primereact/toolbar";
import { InputTextarea } from "primereact/inputtextarea";
import { RadioButton } from "primereact/radiobutton";
import { InputNumber } from "primereact/inputnumber";
import { Dialog } from "primereact/dialog";
import { InputText } from "primereact/inputtext";
import { Tag } from "primereact/tag";
import Spinner from "./Spinner";
import Select from "./Select";
import { Dropdown } from "primereact/dropdown";

function Table() {
  let emptyProduct = {
    id: null,
    name: "",
    image: null,
    description: "",
    category: null,
    price: 0,
    quantity: 0,
    rating: 0,
    inventoryStatus: "INSTOCK",
  };

  let emptyUser = {
    NOMBRE: "",
    DEPENDENCIA: "",
    DISTINCION: null,
    CATEGORIA: null,
    CURP: "",
    ID: null,
    ASISTENCIA: 0,
    ASISTENCIA_ACOMPANIANTE: 0,
    ACOMPANIANTE: null,
    NOMBRE_ACOMPANIANTE: null,
    IMPLEMENTO: null,
  };

  const [products, setProducts] = useState(null);
  const [userDialog, setUserDialog] = useState(false);
  const [deleteUserDialog, setDeleteUserDialog] = useState(false);
  const [product, setProduct] = useState(emptyProduct);
  const [users, setUsers] = useState([]);
  const [user, setUser] = useState(emptyUser);
  const [submitted, setSubmitted] = useState(false);
  const [globalFilter, setGlobalFilter] = useState(null);
  const [isLoading, setIsLoading] = useState(true);

  const [dependencias, setDependencias] = useState([]);
  const [categorias, setCategorias] = useState([]);
  const [distinciones, setDistinciones] = useState([]);

  const [selectedDependencia, setSelectedDependencia] = useState(null);
  const [selectedCategoria, setSelectedCategoria] = useState(null);
  const [selectedDistincion, setSelectedDistincion] = useState(null);

  const toast = useRef(null);
  const dt = useRef(null);

  const getUsers = useCallback(async () => {
    const url = "http://localhost/back/read_api.php";
    const url2 = "http://localhost/back/read_categoria.php";
    const url3 = "http://localhost/back/read_dependencia.php";
    const url4 = "http://localhost/back/read_distincion.php";

    let resp = await fetch(url2);
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

    resp = await fetch(url);
    const userResp = await resp.json();
    let users = userResp.data;
    users.forEach((e) => {
      e.ASISTENCIA =
        e.ASISTENCIA === "1" ? "Confirmo asistencia" : "No confirmo";
      e.ASISTENACIA_ACOMPANIANTE =
        e.ASISTENACIA_ACOMPANIANTE === "1"
          ? "Confirmo acompañante"
          : "No acompañante";
      e.IMPLEMENTO = e.IMPLEMENTO === null ? "No implemento" : e.IMPLEMENTO;
      e.NOMBRE_ACOMPANIANTE =
        e.NOMBRE_ACOMPANIANTE === null
          ? "No nombre acompañante"
          : e.NOMBRE_ACOMPANIANTE;
    });
    setUsers([...users]);
    console.log(users);

    setIsLoading(false);
  }, []);

  useEffect(() => {
    getUsers();
  }, [getUsers]);

  const openNew = () => {
    setProduct(emptyProduct);
    setSubmitted(false);
    setUserDialog(true);
  };

  const hideDialog = () => {
    setSubmitted(false);
    setUserDialog(false);
  };

  const hideDeleteUserDialog = () => {
    setDeleteUserDialog(false);
  };

  const saveUser = async () => {
    setSubmitted(true);

    if (user.NOMBRE.length) {
      console.log(user.NOMBRE);
      console.log(user.NOMBRE.length);
      let _users = [...users];
      let _user = { ...user };

      if (user.ID) {
        const index = findIndexById(user.id);

        _users[index] = _user;

        const usuario = {
          nombre: _user.NOMBRE,
          dependencia: _user.DEPENDENCIA,
          distincion: _user.DISTINCION,
          categoria: _user.CATEGORIA,
          curp: _user.CURP,
          asistencia: _user.ASISTENCIA,
          asistenciaAcompaniante: _user.ASISTENCIA_ACOMPANIANTE,
          nombreAcompaniante: _user.NOMBRE_ACOMPANIANTE,
          implemento: _user.IMPLEMENTO,
        };

        const userNuevo = JSON.stringify(usuario);

        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");

        var requestOptions = {
          method: "PUT",
          headers: myHeaders,
          body: userNuevo,
        };
        await fetch("http://localhost/back/update_api.php", requestOptions);

        toast.current.show({
          severity: "success",
          summary: "Successful",
          detail: "Product Updated",
          life: 3000,
        });
      } else {
        console.log("llegue aqui");
        _user["DEPENDENCIA"] = selectedDependencia.ID_DEPENDENCIA;
        _user["DISTINCION"] = selectedDistincion.ID_DISTINCION;
        _user["CATEGORIA"] = selectedCategoria.ID_CATEGORIA;

        const { ID, ...rest } = _user;

        const usuario = {
          id: rest.ID,
          nombre: rest.NOMBRE,
          dependencia: rest.DEPENDENCIA,
          distincion: rest.DISTINCION,
          categoria: rest.CATEGORIA,
          curp: rest.CURP,
          asistencia: 0,
          asistenciaAcompaniante: 0,
          nombreAcompaniante: null,
          implemento: null,
        };

        const userNuevo = JSON.stringify(usuario);

        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");

        var requestOptions = {
          method: "POST",
          headers: myHeaders,
          body: userNuevo,
        };
        await fetch("http://localhost/back/create_api.php", requestOptions);
        const url = "http://localhost/back/curp_api.php?curp=" + rest.CURP;
        const resp = await fetch(url);
        const user = await resp.json();
        const userNew = user.data;
        _users.push(userNew);

        toast.current.show({
          severity: "success",
          summary: "Successful",
          detail: "User Created",
          life: 3000,
        });
      }

      setUsers(_users);
      setUserDialog(false);
      setUser(emptyUser);
    }
  };

  const editProduct = (user) => {
    setUser({ ...user });
    setUserDialog(true);
  };

  const confirmDeleteUser = (user) => {
    setUser(user);
    setDeleteUserDialog(true);
  };

  const deleteUser = () => {
    let _users = users.filter((val) => val.ID !== user.ID);

    setUsers(_users);
    setDeleteUserDialog(false);
    setUser({});

    const requestOptions = {
      method: "DELETE",
    };

    fetch(`http://localhost/back/delete_api.php?id=${user.ID}`, requestOptions)
      .then((response) => response.text())
      .then((result) => console.log(result));

    toast.current.show({
      severity: "success",
      summary: "Successful",
      detail: "Product Deleted",
      life: 3000,
    });
  };

  const findIndexById = (id) => {
    let index = -1;

    for (let i = 0; i < users.length; i++) {
      if (users[i].id === id) {
        index = i;
        break;
      }
    }

    return index;
  };

  const exportCSV = () => {
    dt.current.exportCSV();
  };

  const onInputChange = (e, name) => {
    const val = (e.target && e.target.value) || "";
    let _user = { ...user };

    _user[`${name}`] = val;

    setUser(_user);
  };

  const leftToolbarTemplate = () => {
    return (
      <div className="flex flex-wrap gap-2">
        <Button
          label="New"
          icon="pi pi-plus"
          severity="success"
          onClick={openNew}
        />
      </div>
    );
  };

  const rightToolbarTemplate = () => {
    return (
      <Button
        label="Export"
        icon="pi pi-upload"
        className="p-button-help"
        onClick={exportCSV}
      />
    );
  };

  const actionBodyTemplate = (rowData) => {
    return (
      <React.Fragment>
        <Button
          icon="pi pi-pencil"
          rounded
          outlined
          className="mr-2"
          onClick={() => editProduct(rowData)}
        />
        <Button
          icon="pi pi-trash"
          rounded
          outlined
          severity="danger"
          onClick={() => confirmDeleteUser(rowData)}
        />
      </React.Fragment>
    );
  };

  const header = (
    <div className="flex flex-wrap gap-2 align-items-center justify-content-between">
      <h4 className="m-0">Galardonados</h4>
      <span className="p-input-icon-left">
        <i className="pi pi-search" />
        <InputText
          type="search"
          onInput={(e) => setGlobalFilter(e.target.value)}
          placeholder="Search..."
        />
      </span>
    </div>
  );
  const userDialogFooter = (
    <React.Fragment>
      <Button label="Cancel" icon="pi pi-times" outlined onClick={hideDialog} />
      <Button label="Save" icon="pi pi-check" onClick={saveUser} />
    </React.Fragment>
  );
  const deleteUserDialogFooter = (
    <React.Fragment>
      <Button
        label="No"
        icon="pi pi-times"
        outlined
        onClick={hideDeleteUserDialog}
      />
      <Button
        label="Yes"
        icon="pi pi-check"
        severity="danger"
        onClick={deleteUser}
      />
    </React.Fragment>
  );

  if (isLoading) return <Spinner></Spinner>;

  return (
    <div className="mt-5 pl-8 pr-8">
      <Toast ref={toast} />
      <div className="card">
        <Toolbar
          className="mb-4"
          left={leftToolbarTemplate}
          right={rightToolbarTemplate}
        ></Toolbar>

        <DataTable
          ref={dt}
          value={users}
          dataKey="ID"
          paginator
          rows={5}
          rowsPerPageOptions={[5, 10, 25]}
          paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport RowsPerPageDropdown"
          currentPageReportTemplate="Showing {first} to {last} of {totalRecords} products"
          globalFilter={globalFilter}
          header={header}
        >
          <Column
            field="ID"
            header="Id"
            sortable
            style={{ minWidth: "12rem" }}
          ></Column>
          <Column
            field="NOMBRE"
            header="Nombre"
            sortable
            style={{ minWidth: "16rem" }}
          ></Column>

          <Column
            field="DEPENDENCIA"
            header="Dependencia"
            sortable
            style={{ minWidth: "8rem" }}
          ></Column>
          <Column
            field="DISTINCION"
            header="Distinción"
            sortable
            style={{ minWidth: "10rem" }}
          ></Column>
          <Column
            field="CATEGORIA"
            header="Categoria"
            sortable
            style={{ minWidth: "10rem" }}
          ></Column>
          <Column
            field="ASISTENCIA"
            header="Asistencia"
            sortable
            style={{ minWidth: "10rem" }}
          ></Column>

          <Column
            body={actionBodyTemplate}
            exportable={false}
            style={{ minWidth: "12rem" }}
          ></Column>
        </DataTable>
      </div>

      <Dialog
        visible={userDialog}
        style={{ width: "32rem" }}
        breakpoints={{ "960px": "75vw", "641px": "90vw" }}
        header="Galardonado"
        modal
        className="p-fluid"
        footer={userDialogFooter}
        onHide={hideDialog}
      >
        <div className="field">
          <label htmlFor="name" className="font-bold">
            Nombre
          </label>
          <InputText
            id="name"
            value={user.NOMBRE}
            onChange={(e) => onInputChange(e, "NOMBRE")}
            required
            autoFocus
            className={classNames({ "p-invalid": submitted && !user.NOMBRE })}
          />
          {submitted && !user.NOMBRE && (
            <small className="p-error">Nombre es obligatorio.</small>
          )}
        </div>

        <div className="field">
          <label htmlFor="curp" className="font-bold">
            Curp
          </label>
          <InputText
            id="curp"
            value={user.CURP}
            onChange={(e) => onInputChange(e, "CURP")}
            required
            autoFocus
            className={classNames({ "p-invalid": submitted && !user.CURP })}
          />
          {submitted && !user.CURP && (
            <small className="p-error">Name is required.</small>
          )}
        </div>

        <div className="field">
          <label htmlFor="dependencia" className="font-bold">
            Dependencia
          </label>
          <Dropdown
            id="dependencia"
            value={selectedDependencia}
            onChange={(e) => setSelectedDependencia(e.value)}
            options={!isLoading ? dependencias : null}
            optionLabel="DEPENDENCIA"
            filter
            placeholder="Select an option"
          />
        </div>

        <div className="field">
          <label htmlFor="distincion" className="font-bold">
            Distincion
          </label>
          <Dropdown
            id="distincion"
            value={selectedDistincion}
            onChange={(e) => setSelectedDistincion(e.value)}
            options={!isLoading ? distinciones : null}
            optionLabel="DISTINCION"
            filter
            placeholder="Select an option"
          />
        </div>

        <div className="field">
          <label htmlFor="categoria" className="font-bold">
            Categoria
          </label>
          <Dropdown
            id="categoria"
            value={selectedCategoria}
            onChange={(e) => setSelectedCategoria(e.value)}
            options={!isLoading ? categorias : null}
            optionLabel="CATEGORIA"
            filter
            placeholder="Select an option"
          />
        </div>
      </Dialog>

      <Dialog
        visible={deleteUserDialog}
        style={{ width: "32rem" }}
        breakpoints={{ "960px": "75vw", "641px": "90vw" }}
        header="Confirm"
        modal
        footer={deleteUserDialogFooter}
        onHide={hideDeleteUserDialog}
      >
        <div className="confirmation-content">
          <i
            className="pi pi-exclamation-triangle mr-3"
            style={{ fontSize: "2rem" }}
          />
          {user && (
            <span>
              Are you sure you want to delete <b>{user.NOMBRE}</b>?
            </span>
          )}
        </div>
      </Dialog>
    </div>
  );
}

export default Table;
