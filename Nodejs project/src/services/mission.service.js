import { addMission } from "../repositories/mission.repository.js";
export const CreateMission = async (data) => {
  const insertMission = await addMission({
    store_name: data.store_name,
    payment: data.payment,
    point: data.point,
  });

  if (insertMission === 0) {
    throw new Error("미션을 생성할 수 없습니다.");
  }
};
