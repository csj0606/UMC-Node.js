import { pool } from "../db.config.js";

export const createReview = async (data) => {
  const conn = await pool.getConnection();

  try {
    const [storeid] = await pool.query(`SELECT id FROM store WHERE name =?;`, [
      data.store_name,
    ]);

    if (!storeid || storeid.length === 0 || !storeid[0].id) {
      throw new Error("존재하지 않는 가게입니다.");
    }

    const [result] = await pool.query(
      `INSERT INTO review (user_id,store_id,score,text) VALUES (?, ?, ?, ?);`,
      [data.user_id, storeid[0].id, data.score, data.text]
    );

    return result.insertId;
  } catch (err) {
    throw new Error(
      `오류가 발생했어요. 존재하는 가게인지 확인해주세요. (${err})`
    );
  } finally {
    conn.release();
  }
};
