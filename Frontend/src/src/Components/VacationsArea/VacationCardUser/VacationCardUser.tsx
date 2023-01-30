import { useState } from "react";
import FollowerModel from "../../../Models/FollowerModel";
import VacationModel from "../../../Models/VacationModel";
import authService from "../../../Services/AuthService";
import followersService from "../../../Services/FollowersService";
import appConfig from "../../../Utils/Config";
import "./VacationCardUser.css";
import swal from "sweetalert";
import { Checkbox } from "@mui/material";
import { Favorite, FavoriteBorder } from "@mui/icons-material";

interface VacationCardProps {
    vacation: VacationModel;
    updateVacations: () => void;
}

function VacationCardUser(props: VacationCardProps): JSX.Element {
    const [followers, setFollowers] = useState(props.vacation.followersAmount);
    const [isFollowing, setIsFollowing] = useState(props.vacation.isFollow);
    const { updateVacations } = props;
    async function isFollow() {
        try {

            const vacationId = props.vacation.vacationId;
            const userId = await authService.getUserIdFromToken();

            const follower = new FollowerModel();
            follower.vacationId = vacationId;
            follower.userId = userId;

            if (isFollowing) {
                setIsFollowing(0)
                setFollowers(followers - 1)
                await followersService.deleteFollower(follower);
                updateVacations();
            } else {
                setIsFollowing(1)
                setFollowers(followers + 1)
                await followersService.addFollower(follower);
            }


        } catch (err: any) {
            swal({
                title: err,
                icon: "error"
            });
        }
    }

    function showDescription(vacation: VacationModel) {
        swal(vacation.description);
    }

    return (
        <div className="VacationCardUser">
            <div className="Card">

                <label className="ContainerBox">
                    <Checkbox icon={<FavoriteBorder />} checkedIcon={<Favorite />} defaultChecked={isFollowing === 1 ? true : false} onClick={() => { isFollow() }} />
                </label>

                <span> {followers} </span>

                <img crossOrigin="anonymous" src={appConfig.vacationsImageUrl + props.vacation.imageName} />
                <br />

                <p className="Destination">{props.vacation.destination}</p>
                <p>Check In: {props.vacation.checkIn}</p>
                <p>Check Out: {props.vacation.checkOut}</p>
                <p>Price: {props.vacation.price}$</p><br />

                <button className="Description" id="card-button" onClick={() => showDescription(props.vacation)}>More info</button>

            </div>

        </div>
    );
}

export default VacationCardUser;