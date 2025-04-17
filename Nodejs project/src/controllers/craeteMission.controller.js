import { StatusCodes } from "http-status-codes";
import { bodyToMission } from "../dtos/mission.dto.js";
import { CreateMission } from "../services/mission.service.js";

export const createMission = async (req, res, next) => {
  const data = {
    ...req.body,
    ...req.query,
  };

  console.log("가게에 새로운 미션 추가");
  console.log("data:", data);
  const mission = await CreateMission(bodyToMission(data));
  res.status(StatusCodes.OK).json({ result: mission });
};
