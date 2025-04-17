import { StatusCodes } from "http-status-codes";
import { bodyCreateUserMission } from "../dtos/use_mission.dto.js";
import { CreateUserMission } from "../services/user_mission.service.js";

export const createUserMission = async (req, res, next) => {
  const data = {
    ...req.body,
    ...req.query,
  };

  console.log("새로운 미션 도전");
  console.log("data:", data);
  const userMission = await CreateUserMission(bodyCreateUserMission(data));
  res.status(StatusCodes.OK).json({ result: userMission });
};
