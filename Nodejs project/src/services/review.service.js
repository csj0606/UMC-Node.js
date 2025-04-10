import { createReview } from "../repositories/review.repository.js";
export const CreateReview = async (data) => {
  const joinStoreId = await createReview({
    user_id: data.user_id,
    store_name: data.store_name,
    score: data.score,
    text: data.text,
  });

  if (joinStoreId === 0) {
    throw new Error("리뷰를 작성할 수 없습니다.");
  }
};
