export const bodyCreateUserMission = (body) => {
  return {
    mission_id: body.mission_id,
    user_id: body.user_id,
    is_completed: body.is_completed || 0,
  };
};
