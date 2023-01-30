import { NextFunction, Request, Response } from "express";
import cyber from "../2-utils/cyber";
import { UnauthorizedError } from "../4-models/error-models";

async function verifyAdmin(request: Request, response: Response, next: NextFunction) {

    try {
        const isAdmin = await cyber.verifyAdmin(request);
        console.log(isAdmin);

        if (!isAdmin) throw new UnauthorizedError("You are not admin");
        next();
    }
    catch (err: any) {
        next(err);
    }

}

export default verifyAdmin;