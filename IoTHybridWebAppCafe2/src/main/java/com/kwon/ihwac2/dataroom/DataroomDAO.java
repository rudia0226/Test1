package com.kwon.ihwac2.dataroom;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kwon.ihwac2.member.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class DataroomDAO {

	@Autowired
	private SqlSession ss;

	public void delete(Data d, HttpServletRequest req, HttpServletResponse res) {
		try {
			String fileName = d.getId_file();
			fileName = URLDecoder.decode(fileName, "euc-kr");

			if (ss.getMapper(DataroomMapper.class).delete(d) == 1) {
				req.setAttribute("r", "���� ����");
				String path = req.getSession().getServletContext().getRealPath("resources/etc");
				File f = new File(path + "/" + fileName);
				f.delete();
			} else {
				req.setAttribute("r", "���� ����");
			}
		} catch (Exception e) {
			req.setAttribute("r", "���� ����");
		}
	}

	public void getAllData(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("datas", ss.getMapper(DataroomMapper.class).getAllData());
	}

	public void upload(Data d, HttpServletRequest req, HttpServletResponse res) {
		try {
			String path = req.getSession().getServletContext().getRealPath("resources/etc");

			MultipartRequest mr = new MultipartRequest(req, path, 209715200, "euc-kr", new DefaultFileRenamePolicy());

			Member m = (Member) req.getSession().getAttribute("loginMember");

			String id_file = mr.getFilesystemName("id_file");
			id_file = URLEncoder.encode(id_file, "euc-kr");
			id_file = id_file.replace("+", " ");

			d.setId_title(mr.getParameter("id_title"));
			d.setId_owner(m.getIm_id());
			d.setId_file(id_file);

			if (ss.getMapper(DataroomMapper.class).upload(d) == 1) {
				req.setAttribute("r", "���ε� ����");
			} else {
				req.setAttribute("r", "���ε� ����");
			}
		} catch (Exception e) {
			req.setAttribute("r", "���ε� ����");
		}
	}
}
