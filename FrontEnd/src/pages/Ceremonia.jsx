import { useParams } from "react-router-dom";
import NavBar from "../components/NavBar";
import RegistroCeremonia from "../components/RegistroCeremonia";
function Ceremonia() {
  const { id } = useParams();

  return (
    <>
      <NavBar />
      <RegistroCeremonia id={id} />
    </>
  );
}

export default Ceremonia;
