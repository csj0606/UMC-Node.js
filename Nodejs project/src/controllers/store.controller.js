import { StatusCodes } from "http-status-codes";
import { bodyCreateStoreByRegion } from "../dtos/store.dto.js";
import { createStoreByRegion } from "../services/store.service.js";

export const handleStoreCreate = async (req, res, next) => {
  console.log("지역에 새로운 가게 추가");
  console.log("body:", req.body); // 값이 잘 들어오나 확인하기 위한 테스트용

  const store = await createStoreByRegion(bodyCreateStoreByRegion(req.body));
  res.status(StatusCodes.OK).json({ result: store });
};
