import { addUserMission } from "../repositories/user_mission.repository.js";

export const CreateUserMission = async (data) => {
  const insertUserMission = await addUserMission({
    mission_id: data.mission_id,
    user_id: data.user_id,
    is_completed: data.is_completed,
  });

  if (insertUserMission === 0) {
    throw new Error("미션을 생성할 수 없습니다.");
  }
};
