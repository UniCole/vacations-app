import { useEffect, useState } from "react";
import VacationModel from "../../../Models/VacationModel";
import vacationsService from "../../../Services/VacationsService";
import "./VacationList.css";
import swal from "sweetalert";
import UserModel from "../../../Models/UserModel";
import useVerifyLoggedIn from "../../../Utils/useVerifyLoggedIn";
import { authStore } from "../../../Redux/AuthState";
import VacationCardUser from "../VacationCardUser/VacationCardUser";
import VacationCardAdmin from "../VacationCardAdmin/VacationCardAdmin";
import { VacationsActionType, vacationsStore } from "../../../Redux/VacationsState";
import notifyService from "../../../Services/NotifyService";


function VacationList(): JSX.Element {

    useVerifyLoggedIn();

    const [vacations, setVacations] = useState<VacationModel[]>([]);
    let user: UserModel = authStore.getState().user;

    const [showFollowed, setShowFollowed] = useState<boolean>(false);

    useEffect(() => {

        if (user?.roleId === 2) {
            vacationsStore.dispatch({ type: VacationsActionType.EmptyVacations, payload: [] });
            vacationsService.getAllVacationsForUser(user.userId)
                .then(vacations => {
                    setVacations(vacations);
                })
                .catch(err => notifyService.error(err));
        }
        else {
            vacationsService.getAllVacationsForAdmin()
                .then(vacations => setVacations(vacations))
                .catch(err => notifyService.error(err));
        }
    }, []);

    async function showVacations() {
        try {
            vacationsStore.dispatch({ type: VacationsActionType.EmptyVacations, payload: [] });
            const vacations = await vacationsService.getAllVacationsForUser(user.userId);


            if (showFollowed) {
                setVacations(vacations.filter(v => v.isFollow))
            }
            else {
                setVacations(vacations);
            }

        } catch (err: any) {
            swal({
                title: err,
                icon: "error"
            });
        }
    }


    useEffect(() => {
        showVacations();
    }, [showFollowed])

    const [currentPage, setCurrentPage] = useState(1);
    const itemsPerPage = 9;
    const totalItems = vacations.length;
    const totalPages = Math.ceil(totalItems / itemsPerPage);

    const handlePageChange = (page: number) => {
        setCurrentPage(page);
        showVacations();
    };

    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const currentItems = vacations.slice(startIndex, endIndex);

    return (
        <div className="VacationList">

            {user?.roleId === 2 && <>

                <div className="FollowedVacations">
                    <label htmlFor="FollowedVacations">Favorite Vacations </label></div>
                <label className="ContainerBox2">
                    <input type="checkbox" onChange={() => setShowFollowed(!showFollowed)} checked={showFollowed} onClick={() => handlePageChange(1)} />
                    <div className="CheckmarkFollowed">

                    </div>
                </label>

                <div className="ContainerUser">
                    {currentItems.map((v) =>
                        <div className="UserVacations" key={v.vacationId}>
                            <VacationCardUser vacation={v} updateVacations={() => showVacations()} />
                        </div>
                    )}
                </div>
                <div className="Pagination">
                    <button onClick={() => handlePageChange(currentPage - 1)} disabled={currentPage === 1}>
                        Previous
                    </button>
                    <span>Page {currentPage} of {totalPages} </span>
                    <button onClick={() => handlePageChange(currentPage + 1)} disabled={currentPage === totalPages}>
                        Next
                    </button>
                </div>
            </>}

            {user?.roleId === 1 && <>

                <div className="ContainerAdmin">
                    {currentItems.map((v) => (
                        <div className="AdminVacations" key={v.vacationId}>
                            <VacationCardAdmin vacation={v} />
                        </div>
                    ))}
                </div>

                <div className="Pagination">
                    <button onClick={() => handlePageChange(currentPage - 1)} disabled={currentPage === 1}>
                        Previous
                    </button>
                    <span>Page {currentPage} of {totalPages} </span>
                    <button onClick={() => handlePageChange(currentPage + 1)} disabled={currentPage === totalPages}>
                        Next
                    </button>
                </div>
            </>}

        </div>

    );
}

export default VacationList;