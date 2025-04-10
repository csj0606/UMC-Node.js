import { addStoreByRegion } from "../repositories/store.repository.js";

export const createStoreByRegion = async (data) => {
  const joinStoreId = await addStoreByRegion({
    name: data.name,
    region: data.region,
    food_category: data.food_category,
  });

  if (joinStoreId === 0) {
    throw new Error("존재하지 않는 지역입니다");
  }
};
