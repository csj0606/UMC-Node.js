import { pool } from "../db.config.js";

export const addStoreByRegion = async (data) => {
  const conn = await pool.getConnection();

  try {
    const [regionid] = await pool.query(
      `SELECT id FROM region WHERE name =?;`,
      [data.region]
    );

    if (regionid.length === 0) {
      return null; // 존재 안 하면 insert 안 함
    }

    const [food_category_id] = await pool.query(
      `SELECT id FROM food_category WHERE name = ?;`,
      data.food_category
    );

    const [result] = await pool.query(
      `INSERT INTO store (name,region_id,food_category_id) VALUES (?, ?, ?);`,
      [data.name, regionid[0].id, food_category_id[0].id]
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
