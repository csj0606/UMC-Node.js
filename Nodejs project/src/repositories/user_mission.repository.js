import { pool } from "../db.config.js";

export const addUserMission = async (data) => {
  const conn = await pool.getConnection();

  try {
    const [usermission] = await pool.query(
      `SELECT * FROM user_mission WHERE mission_id =? AND user_id =?;`,
      [data.mission_id, data.user_id]
    );

    if (!(usermission.length === 0)) {
      throw new Error("이미 도전중인 미션입니다.");
    }

    const [result] = await pool.query(
      `INSERT INTO user_mission (user_id,mission_id,is_completed) VALUES (?, ?, ?);`,
      [data.user_id, data.mission_id, data.is_completed]
    );

    return result.id;
  } catch (err) {
    throw new Error(
      `오류가 발생했어요. 요청 파라미터를 확인해주세요. (${err})`
    );
  } finally {
    conn.release();
  }
};
