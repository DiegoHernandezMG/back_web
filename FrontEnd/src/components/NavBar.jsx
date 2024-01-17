import React, { useEffect } from "react";
import { Menubar } from "primereact/menubar";
import { Avatar } from "primereact/avatar";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../contexts/AuthContext";

export default function NavBar() {
  const navigate = useNavigate();
  const { isAuthenticated, logout } = useAuth();

  const admin_item = {
    label: "Admin",
    icon: "pi pi-user-edit",
    command: () => {
      navigate("/admin");
    },
  };

  const items = [
    {
      label: "Home",
      icon: "pi pi-home",
      command: () => {
        navigate("/");
      },
    },
  ];

  if (isAuthenticated) {
    items.push(admin_item);
  }

  // useEffect(() => {
  //   if (isAuthenticated === true) {
  //     items.push(admin_item);
  //   }
  // }, [isAuthenticated]);

  const handleLogout = () => {
    logout();
    navigate("/", { replace: true });
  };

  const start = (
    <img alt="logo" src="/ipn.png" height="60" className="mr-2"></img>
  );
  const end = (
    <div className="flex align-items-center gap-2">
      {isAuthenticated ? (
        <>
          <p>LogOut</p>
          <Avatar
            icon="pi pi-user"
            style={{ backgroundColor: "#DD1C3C", color: "#ffffff" }}
            shape="circle"
            onClick={handleLogout}
          />
        </>
      ) : (
        <>
          <p>Admin</p>
          <Avatar
            icon="pi pi-user"
            style={{ backgroundColor: "#8D1313", color: "#ffffff" }}
            shape="circle"
            onClick={() => navigate(`/login`)}
          />
        </>
      )}
    </div>
  );

  return (
    <div className="card">
      <Menubar model={items} start={start} end={end} />
    </div>
  );
}
