import { StatusCodes } from "http-status-codes";
import { bodyToReview } from "../dtos/review.dto.js";
import { CreateReview } from "../services/review.service.js";

export const createStoreReview = async (req, res, next) => {
  console.log("가게에 새로운 리뷰 추가");
  console.log("body:", req.body); // 값이 잘 들어오나 확인하기 위한 테스트용

  const review = await CreateReview(bodyToReview(req.body));
  res.status(StatusCodes.OK).json({ result: review });
};
