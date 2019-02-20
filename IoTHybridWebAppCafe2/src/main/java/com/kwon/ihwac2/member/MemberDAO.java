package com.kwon.ihwac2.member;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;

	public void autologin(HttpServletRequest req, HttpServletResponse res) {
		Cookie[] cookies = req.getCookies();

		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("ihwacAutoLoginID")) {
					String im_id = c.getValue();
					if (im_id != null) {
						Member m = new Member();
						m.setIm_id(im_id);

						Member dbM = ss.getMapper(MemberMapper.class).getMemberById(m);

						if (dbM != null) {
							req.getSession().setAttribute("loginMember", dbM);
							req.getSession().setMaxInactiveInterval(1200);
						}

					}
				}
			}
		}
	}

	public void bye(Member m, HttpServletRequest req, HttpServletResponse res) {
		try {
			if (ss.getMapper(MemberMapper.class).bye(m) == 1) {
				req.setAttribute("r", "탈퇴 성공");

				Member lm = (Member) req.getSession().getAttribute("loginMember");
				String imgFile = lm.getIm_img();
				imgFile = URLDecoder.decode(imgFile, "euc-kr");
				String path = req.getSession().getServletContext().getRealPath("resources/etc");
				File f = new File(path + "/" + imgFile);
				f.delete();

			} else {
				req.setAttribute("r", "탈퇴 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "탈퇴 실패");
		}
	}

	public Members idCheck(Member m, HttpServletRequest req, HttpServletResponse res) {
		return 
			new Members(
				ss.getMapper(MemberMapper.class)
				.getMemberById2(m));
	}

	public void join(Member m, HttpServletRequest req, HttpServletResponse res) {
		try {
			String path = req.getSession().getServletContext().getRealPath("resources/etc");

			MultipartRequest mr = new MultipartRequest(req, path, 30 * 1024 * 1024, "euc-kr",
					new DefaultFileRenamePolicy());

			String im_img = mr.getFilesystemName("im_img");
			im_img = URLEncoder.encode(im_img, "euc-kr");
			im_img = im_img.replace("+", " ");

			m.setIm_id(mr.getParameter("im_id"));
			m.setIm_pw(mr.getParameter("im_pw"));
			m.setIm_name(mr.getParameter("im_name"));
			m.setIm_addr1(mr.getParameter("im_addr1"));
			m.setIm_addr2(mr.getParameter("im_addr2"));
			m.setIm_addr3(mr.getParameter("im_addr3"));
			m.setIm_img(im_img);

			if (ss.getMapper(MemberMapper.class).join(m) == 1) {
				req.setAttribute("r", "가입 성공");
			} else {
				req.setAttribute("r", "가입 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "가입 실패");
		}
	}

	public void login(Member m, HttpServletRequest req, HttpServletResponse res) {
		try {
			Member dbM = ss.getMapper(MemberMapper.class).getMemberById(m);

			if (dbM != null) {
				if (m.getIm_pw().equals(dbM.getIm_pw())) {
					req.getSession().setAttribute("loginMember", dbM);
					req.getSession().setMaxInactiveInterval(1200);

					if (req.getParameter("im_autologin") != null) {
						Cookie c = new Cookie("ihwacAutoLoginID", dbM.getIm_id());
						c.setMaxAge(86400);
						res.addCookie(c);
					}

				} else {
					req.setAttribute("r", "비번 오류");
				}
			} else {
				req.setAttribute("r", "그런 계정 없음");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "DB서버문제");
		}
	}

	public boolean loginCheck(HttpServletRequest req, HttpServletResponse res) {
		Member m = (Member) req.getSession().getAttribute("loginMember");

		if (m != null) {
			req.setAttribute("loginPage", "member/loginOK.jsp");
			return true;
		} else {
			req.setAttribute("loginPage", "member/login.jsp");
			return false;
		}
	}

	public void logout(HttpServletRequest req, HttpServletResponse res) {
		req.getSession().setAttribute("loginMember", null);

		Cookie[] cookies = req.getCookies();

		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("ihwacAutoLoginID")) {
					c.setValue(null); // id값 삭제
					res.addCookie(c);
				}
			}
		}
	}

	public void update(Member m, HttpServletRequest req, HttpServletResponse res) {
		try {
			String path = req.getSession().getServletContext().getRealPath("resources/etc");

			MultipartRequest mr = new MultipartRequest(req, path, 30 * 1024 * 1024, "euc-kr",
					new DefaultFileRenamePolicy());

			Member lm = (Member) req.getSession().getAttribute("loginMember");
			String imgFile = lm.getIm_img();
			String im_img = mr.getFilesystemName("im_img");
			if (im_img != null) {
				im_img = URLEncoder.encode(im_img, "euc-kr");
				im_img = im_img.replace("+", " ");

				imgFile = URLDecoder.decode(imgFile, "euc-kr");
				File f = new File(path + "/" + imgFile);
				f.delete();
			} else {
				im_img = imgFile;
			}
			m.setIm_id(mr.getParameter("im_id"));
			m.setIm_pw(mr.getParameter("im_pw"));
			m.setIm_name(mr.getParameter("im_name"));
			m.setIm_addr1(mr.getParameter("im_addr1"));
			m.setIm_addr2(mr.getParameter("im_addr2"));
			m.setIm_addr3(mr.getParameter("im_addr3"));
			m.setIm_img(im_img);

			if (ss.getMapper(MemberMapper.class).update(m) == 1) {
				req.setAttribute("r", "정보수정 성공");
				req.getSession().setAttribute("loginMember", ss.getMapper(MemberMapper.class).getMemberById(m));

			} else {
				req.setAttribute("r", "정보수정 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "정보수정 실패");
		}
	}
}





