import { StatusCodes } from "http-status-codes";
import { bodyToReview } from "../dtos/review.dto.js";
import { CreateReview } from "../services/review.service.js";

export const createStoreReview = async (req, res, next) => {
  const data = {
    ...req.body,
    ...req.query,
  };

  console.log("가게에 새로운 리뷰 추가");
  console.log("data:", data);
  const review = await CreateReview(bodyToReview(data));
  res.status(StatusCodes.OK).json({ result: review });
};
