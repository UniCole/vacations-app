import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import authService from "../../../Services/AuthService";
import swal from "sweetalert";

function Logout(): JSX.Element {

    const navigate = useNavigate();

    useEffect(() => {

        authService.logout();

        swal("Bye bye....");

        navigate("/login");

    }, []);


    return null;
}

export default Logout;

