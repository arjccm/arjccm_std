package com.arjjs.ccm.modules.ccm.file.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.modules.ccm.fence.entity.CcmElecfenceAlarm;
import com.arjjs.ccm.modules.pbs.common.config.Global;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

/**
 * 文件下载Controller
 * @author cby
 * @version 2020-04-08
 */
@Controller
@RequestMapping(value = "${adminPath}/ccmfile/file")
public class ccmFileDownloadController {

    @RequestMapping(value = {"download", ""})
    public void list(HttpServletRequest request, HttpServletResponse response, String filepath) {
        String fileurl = null;
        if(filepath.contains("userfiles")){
            fileurl = Global.getConfig("FILE_UPLOAD_PATH2")+filepath.split("userfiles/")[1];
        }else{
            fileurl = Global.getConfig("FILE_UPLOAD_PATH")+filepath.split("arjccmupload/")[1];
        }
        File file = new File(fileurl);
        // 取得文件名。
        String fileName = file.getName();
        InputStream fis = null;
        try {
            fis = new FileInputStream(file);
            request.setCharacterEncoding("UTF-8");
            String agent = request.getHeader("User-Agent").toUpperCase();
            if ((agent.indexOf("MSIE") > 0) || ((agent.indexOf("RV") != -1) && (agent.indexOf("FIREFOX") == -1)))
                fileName = URLEncoder.encode(fileName, "UTF-8");
            else {
                fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
            }
            response.reset();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/force-download");// 设置强制下载不打开
            response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
            response.setHeader("Content-Length", String.valueOf(file.length()));

            byte[] b = new byte[1024];
            int len;
            while ((len = fis.read(b)) != -1) {
                response.getOutputStream().write(b, 0, len);
            }
            response.flushBuffer();
            fis.close();
        }catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
