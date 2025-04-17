import { pool } from "../db.config.js";

export const addMission = async (data) => {
  const conn = await pool.getConnection();

  try {
    const [storeid] = await pool.query(`SELECT id FROM store WHERE name =?;`, [
      data.store_name,
    ]);

    if (storeid.length === 0) {
      return null; // 존재 안 하면 insert 안 함
    }

    const name = `${data.store_name}에서 ${data.payment}원 이상 결제하면 ${data.point}포인트 적립`;

    const [result] = await pool.query(
      `INSERT INTO mission (name,store_id,payment,point) VALUES (?, ?, ?, ?);`,
      [name, storeid[0].id, data.payment, data.point]
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
