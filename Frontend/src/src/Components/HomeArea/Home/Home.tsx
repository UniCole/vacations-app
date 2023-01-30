import "./Home.css";
import bgVideo from "../../../Assets/Videos/backgroundVideo.mp4";

function Home(): JSX.Element {
    return (

        <div className="Home">

            <h1>Welcome to UniCole Vacations! </h1>
            <br /><br />

            <iframe
                src={bgVideo} allow='autoplay; encrypted-media' allowFullScreen >
            </iframe>

        </div>
    );
}

export default Home;
