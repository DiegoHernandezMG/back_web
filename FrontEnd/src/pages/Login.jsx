import NavBar from "../components/NavBar";
import { InputText } from "primereact/inputtext";
import { Button } from "primereact/button";
import { Card } from "primereact/card";
import { useState, useEffect } from "react";
import { useAuth } from "../contexts/AuthContext";
import { useNavigate } from "react-router-dom";

function isValidEmail(email) {
  const regexPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return regexPattern.test(email);
}

function Login() {
  const [email, setEmail] = useState("yeimi@gmail.com");
  const [password, setPassword] = useState("");
  const { isAuthenticated, login } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if (isAuthenticated === true) {
      navigate("/admin", { replace: true });
    }
  }, [isAuthenticated, navigate]);

  const handleSubmit = () => {
    if (email && password) {
      login(email, password);
    }
  };

  return (
    <>
      <NavBar />

      <div className="card mt-8 pl-8 pr-8">
        <Card>
          <div className="flex flex-column md:flex-row">
            <div className="w-full flex flex-column align-items-center justify-content-center gap-3 py-5">
              <div className="flex flex-wrap justify-content-center align-items-center gap-2">
                <label className="w-6rem">Email</label>
                <InputText
                  id="username"
                  type=""
                  className="w-12rem"
                  onChange={(e) => setEmail(e.target.value)}
                  value={email}
                />
              </div>
              <div className="flex flex-wrap justify-content-center align-items-center gap-2">
                <label className="w-6rem">Password</label>
                <InputText
                  id="password"
                  type="password"
                  className="w-12rem"
                  onChange={(e) => setPassword(e.target.value)}
                />
              </div>
              <Button
                label="Login"
                icon="pi pi-user"
                className="w-10rem mx-auto mt-4"
                onClick={handleSubmit}
              ></Button>
            </div>
          </div>
        </Card>
      </div>
    </>
  );
}

export default Login;
