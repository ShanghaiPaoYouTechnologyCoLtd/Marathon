package com.apew.marathon.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.apew.marathon.controller.FileReader;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 上传文件存储目录
	private static final String UPLOAD_DIRECTORY = "upload/images/";

	// 上传配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * 上传数据及保存文件
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 检测是否为多媒体上传
		if (!ServletFileUpload.isMultipartContent(request)) {
			// 如果不是则停止
			PrintWriter writer = response.getWriter();
			writer.println("Error: 表单必须包含 enctype=multipart/form-data");
			writer.flush();
			return;
		}

		// 配置上传参数
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// 设置临时存储目录
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// 设置最大文件上传值
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// 设置最大请求值 (包含文件和表单数据)
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// 中文处理
		upload.setHeaderEncoding("UTF-8");

		try {
			// 解析请求的内容提取文件数据
			@SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {
				// 迭代表单数据
				String foldeName = formItems.get(0).getFieldName();  //0为上级目录，1为文件名称，2为文件
				// 构造临时路径来存储上传的文件
				// 这个路径相对当前应用的目录
				String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY+foldeName;

				// 如果目录不存在则创建
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				String fieldName = "";
				for (int i = 1; i < formItems.size(); i++) {
					FileItem item = formItems.get(i);
					// 处理不在表单中的字段
					if (!item.isFormField()) {

						String filePath = uploadPath + File.separator + fieldName;
						File storeFile = new File(filePath);

						// 保存文件到硬盘
						item.write(storeFile);
						request.setAttribute("message", "文件上传成功!");
					} else {
						fieldName = item.getFieldName();
						if (fieldName.indexOf("delete@@") >= 0) { // 接收到要求，删除图片
							fieldName = fieldName.substring(8);
							String filePath = uploadPath + File.separator + fieldName;
							File storeFile = new File(filePath);
							if (storeFile.exists()) {
								storeFile.delete();
								request.setAttribute("message", "删除成功!");
								break;
							}
							request.setAttribute("message", "删除失敗，文件不存在！");
							break;
						}
					}
				}
			}
		} catch (Exception ex) {
			request.setAttribute("message", "错误信息: " + ex.getMessage());
		}

		// 跳转到 message.jsp
		getServletContext().getRequestDispatcher("/system/siteConfig/photoUpload.jsp").forward(request, response);
	}
}