import { useForm } from "react-hook-form";
import { NavLink, useNavigate } from "react-router-dom";
import UserModel from "../../../Models/UserModel";
import authService from "../../../Services/AuthService";
import "./Register.css";
import notifyService from "../../../Services/NotifyService";
import swal from "sweetalert";


function Register(): JSX.Element {

    const { register, handleSubmit , formState}  = useForm<UserModel>();
    const navigate = useNavigate();

    async function send(user: UserModel) {
        try {
            await authService.register(user);
            swal({
                title: "Welcome!",
                icon: "success"
            });

            navigate("/home");
        }
        catch (err: any) {
            notifyService.error(err)
        }

    }

    return (
        <div className="Register">

            <form onSubmit={handleSubmit(send)}>

                <input type="text" autoComplete="off" placeholder="First name:" className="input" {...register("firstName" , UserModel.firstNameValidation)} required />
                <span className="Error">{formState.errors.firstName?.message}</span>
                <br /><br />

                <input type="text" autoComplete="off" placeholder="Last name:" className="input" {...register("lastName" ,UserModel.lastNameValidation)} required />
                <span className="Error">{formState.errors.lastName?.message}</span>
                <br /><br />

                <input type="text" autoComplete="off" placeholder="Username:" className="input" {...register("username", UserModel.usernameValidation)} required />
                <span className="Error">{formState.errors.username?.message}</span>
                <br /><br />

                <input type="password" autoComplete="off" placeholder="Password" className="input" {...register("password" , UserModel.passwordValidation)} required />
                <span className="Error">{formState.errors.password?.message}</span>
                <br /><br />

                <button> <span>Register</span></button>
                <br /><br /><br />

                <NavLink to="/login">Already have an account? Sign in</NavLink>

            </form>
        </div>
    );
}

export default Register;

