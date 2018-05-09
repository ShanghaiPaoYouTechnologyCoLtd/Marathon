package com.apew.marathon.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.apew.marathon.model.RaceModel;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class BaseService<T> {

	@Autowired
	public JdbcTemplate jdbcTemplate;

	/**
	 * 增加
	 * 
	 * @param sql
	 * @param args
	 * @throws DataAccessException
	 * @throws Exception
	 */
	public int create(String sql, Object[] args) {
		if (args == null) {
			args = new Object[] {};
		}
		return jdbcTemplate.update(sql, args);
	}

	/**
	 * 批量增加
	 * 
	 * @param sql
	 * @param batchArgs
	 * @throws @throws
	 *             Exception
	 */
	public void batchCreate(String sql, List<Object[]> batchArgs) {
		if (batchArgs == null) {
			batchArgs = new ArrayList<Object[]>();
		}
		jdbcTemplate.batchUpdate(sql, batchArgs);
	}

	/**
	 * 查询list
	 * 
	 * @param sql
	 * @param args
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryForList(String sql, Object[] args) {
		if (args == null) {
			args = new Object[] {};
		}
		return jdbcTemplate.queryForList(sql, args);
	}

	/**
	 * 查询list
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryForList(String sql) {

		return jdbcTemplate.queryForList(sql);
	}

	/**
	 * @param sql
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryForList(String sql, Map params) {
		NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(jdbcTemplate);
		// return namedParameterJdbcTemplate.queryForList(sql, params);
		return namedParameterJdbcTemplate.queryForList(sql, new MapSqlParameterSource(params));

	}

	/**
	 * @param sql
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<T> queryForList(String sql, Map params, Class<T> clazz) {
		NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(jdbcTemplate);
		return namedParameterJdbcTemplate.query(sql, params, ParameterizedBeanPropertyRowMapper.newInstance(clazz));
	}

	/**
	 * @param sql
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<T> queryForList(String sql, Object[] args, Class<T> clazz) {
		if (args == null) {
			args = new Object[] {};
		}
		return jdbcTemplate.query(sql, args, ParameterizedBeanPropertyRowMapper.newInstance(clazz));
	}

	/**
	 * 查询map
	 * 
	 * @param sql
	 * @param args
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> queryForMap(String sql, Object[] args) {
		Map<String, Object> map = null;
		if (args == null) {
			args = new Object[] {};
		}
		try {
			map = jdbcTemplate.queryForMap(sql, args);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
		return map;
	}

	/**
	 * 查询表格后转换为JSON
	 * 
	 * @param sql
	 * @param args
	 * @return
	 * @throws Exception
	 */
	public String queryForJSON(String sql, Object[] args) {
		List<Map<String, Object>> map = null;
		if (args == null) {
			args = new Object[] {};
		}
		try {
			map = jdbcTemplate.queryForList(sql, args);
			JSONArray jsonObject = JSONArray.fromObject(map);
			return jsonObject.toString();
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	/**
	 * 查询数量
	 * 
	 * @param sql
	 * @param args
	 * @return
	 * @throws Exception
	 */
	public Integer queryForInt(String sql, Object[] args) {
		if (args == null) {
			args = new Object[] {};
		}

		Integer v = jdbcTemplate.queryForObject(sql, args, Integer.class);
		if (v == null)
			return 0;
		return v.intValue();
	}

	/**
	 * 查询数量
	 * 
	 * @param sql
	 * @param args
	 * @return
	 * @throws Exception
	 */
	public int queryForInt(String sql, Map<String, Object> params) {
		NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(jdbcTemplate);
		Integer i = namedParameterJdbcTemplate.queryForObject(sql, params, Integer.class);
		if (i == null) {
			i = 0;
		}
		return i.intValue();
	}

	/**
	 * @param sql
	 * @param params
	 * @return
	 * @return
	 * @throws Exception
	 */
	public T queryForObject(String sql, Object[] args, Class<T> clazz) {
		if (args == null) {
			args = new Object[] {};
		}
		List<T> t = jdbcTemplate.query(sql, args, ParameterizedBeanPropertyRowMapper.newInstance(clazz));
		if (t != null && t.size() > 0)
			return t.get(0);
		return null;
	}

	public RaceModel queryForRaceObject(String sql, Object[] args, Class<RaceModel> clazz) {
		try {
			if (args == null) {
				args = new Object[] {};
			}
			List<RaceModel> t = jdbcTemplate.query(sql, args, ParameterizedBeanPropertyRowMapper.newInstance(clazz));
			if (t != null && t.size() > 0)
				return t.get(0);
			return null;
		} catch (Exception ex) {
			return null;
		}
	}

	/**
	 * 查询List对象
	 * 
	 * @param sql
	 * @param args
	 * @param rowMapper
	 * @return
	 * @throws Exception
	 */
	public List queryForObjectList(String sql, Object[] args, Class clazz) {
		if (args == null) {
			args = new Object[] {};
		}
		return jdbcTemplate.query(sql, args, ParameterizedBeanPropertyRowMapper.newInstance(clazz));
	}

	/**
	 * 修改
	 * 
	 * @param sql
	 * @param args
	 * @return
	 * @throws Exception
	 */
	public int update(String sql, Object[] args) {
		if (args == null) {
			args = new Object[] {};
		}
		return jdbcTemplate.update(sql, args);
	}

	/**
	 * 修改
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public int update(String sql, Map<String, Object> params) {
		NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(jdbcTemplate);
		return namedParameterJdbcTemplate.update(sql, params);
	}

	/**
	 * 批量修改
	 * 
	 * @param sql
	 * @param batchArgs
	 * @return
	 * @throws Exception
	 */
	public int[] batchUpdate(String sql, List<Object[]> batchArgs) {
		if (batchArgs == null) {
			batchArgs = new ArrayList<Object[]>();
		}
		return jdbcTemplate.batchUpdate(sql, batchArgs);
	}

	/**
	 * 删除
	 * 
	 * @param sql
	 * @param args
	 * @throws Exception
	 */
	public int delete(String sql, Object[] args) {
		if (args == null) {
			args = new Object[] {};
		}
		return jdbcTemplate.update(sql, args);
	}

	/**
	 * 插入数据，返回主键
	 * 
	 * @param creator
	 * @return
	 */
	public long create(PreparedStatementCreator creator) {
		if (creator == null)
			return -1L;
		KeyHolder keyholder = new GeneratedKeyHolder();
		jdbcTemplate.update(creator, keyholder);
		Number key = keyholder.getKey();
		if (key != null)
			return key.longValue();// intValue();
		else
			return 0L;
	}

	/**
	 * 插入数据，不返回主键
	 * 
	 * @param creator
	 * @return
	 */
	public void update(PreparedStatementCreator creator) {
		if (creator == null)
			return;
		jdbcTemplate.update(creator);
	}

	public String queryFristString(String sql, Object[] args) {
		try {
			if (args == null) {
				args = new Object[] {};
			}
			String result = jdbcTemplate.queryForObject(sql, args, java.lang.String.class);
			return result;
		} catch (Exception ex) {
			return null;
		}
	}
}
