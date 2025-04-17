export const bodyToMission = (body) => {
  return {
    store_name: body.store_name,
    payment: body.payment,
    point: body.point,
  };
};
