import { useEffect } from "react";
import NavBar from "../components/NavBar";
import { useAuth } from "../contexts/AuthContext";
import { useNavigate } from "react-router-dom";
import Table from "../components/Table";
import Select from "../components/Select";

function Admin() {
  const { isAuthenticated } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if (isAuthenticated === false) {
      navigate("/", { replace: true });
    }
  }, [isAuthenticated, navigate]);

  return (
    <div>
      <NavBar />
      <Table />
    </div>
  );
}

export default Admin;
