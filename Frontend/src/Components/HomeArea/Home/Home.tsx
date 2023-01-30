import "./Home.css";
import bgVideo from "../../../Assets/Videos/backgroundVideo.mp4";
import { NavLink } from "react-router-dom";

function Home(): JSX.Element {
    return (

        <div className="Home">

            <h1>Welcome to UniCole Vacations! </h1>
            <br /><br />

            <p> Get Ready for the Trip of a Lifetime!
                <br />
                Escape to Your Dream Destination with UniCole Vacations. Discover the world's most breathtaking destinations and plan the ultimate getaway today!
                <br />
                <br />
                <br />
                Not registered yet?<br/>
                Than what are you waiting for?

                <NavLink to="/register" className="Link">Sign up now</NavLink>
            </p>
            <video
                autoPlay
                loop
                src={bgVideo}
                className="bg-video"
            ></video>

        </div>
    );
}

export default Home;