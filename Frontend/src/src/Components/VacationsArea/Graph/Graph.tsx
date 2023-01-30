import { useEffect, useState } from "react";
import vacationsService from "../../../Services/VacationsService";
import notifyService from "../../../Services/NotifyService";
import VacationModel from "../../../Models/VacationModel";
import { Chart as ChartJS, CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend } from "chart.js";
import { Bar } from "react-chartjs-2";
import useVerifyLoggedIn from "../../../Utils/useVerifyLoggedIn";

ChartJS.register(
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend
);

export default function FollowersGraph() {

    useVerifyLoggedIn();

    const options = {
        responsive: true,
        plugins: {
            legend: {
                display: false
            }
        },
        scales: {
            y: {
                ticks: {
                    color: "white",
                    stepSize: 1,
                    beginAtZero: true
                }
            },
            x: {
                ticks: {
                    color: "white",
                    stepSize: 1,
                    beginAtZero: true
                }
            }
        }

    };

    const [vacations, setVacations] = useState<VacationModel[]>([]);

    useEffect(() => {
        vacationsService
            .getAllVacationsForAdmin()
            .then((vacations) => setVacations(vacations))
            .catch((err) => notifyService.error(err));
    }, []);

    const data = {
        labels: vacations.map(v => v.destination),
        datasets: [
            {
                data: vacations.map((v: VacationModel) => v.followersAmount),
                backgroundColor: "#d7b379ca"
            },
        ]
    };

    return <Bar options={options} data={data} width="80%" height="32%" />;
}