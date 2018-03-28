package Action;

import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

public class KindEditorAction {
    private File imgFile;

    //文件名称
    private String imgFileFileName;

    //图片宽高
    private String imgWidth;
    private String imgHeight;

    //图片对齐方式
    private String align;

    //图片标题
    private String title;

    public void uploadImg() {
        ServletActionContext.getResponse().setContentType("text/html; charset=UTF-8");

        //文件保存目录路径
        String savePath = ServletActionContext.getServletContext().getRealPath("/");

        //文件保存目录URL
        String saveUrl  = "";

        //定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

        //最大文件大小
        long maxSize = 5000000;

        PrintWriter out = null;
        try {
            out = ServletActionContext.getResponse().getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }


        if(imgFile == null){
            out.println(getError("请选择文件。"));
            return;
        }

        //检查目录
        File uploadDir = new File(savePath);
        if(!uploadDir.isDirectory()){
            out.println(getError("上传目录不存在。"));
            return;
        }
        //检查目录写权限
        if(!uploadDir.canWrite()){
            out.println(getError("上传目录没有写权限。"));
            return;
        }

        String dirName = ServletActionContext.getRequest().getParameter("dir");
        if (dirName == null) {
            dirName = "image";
        }
        if(!extMap.containsKey(dirName)){
            out.println(getError("目录名不正确。"));
            return;
        }
        //创建文件夹
        savePath += dirName + "/";
        saveUrl += dirName + "/";
        File saveDirFile = new File(savePath);
        if (!saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        savePath += ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }

        //检查文件大小
        if(imgFile.length() > maxSize){
            out.println(getError("上传文件大小超过限制。"));
            return;
        }
        //检查扩展名
        String fileExt = imgFileFileName.substring(imgFileFileName.lastIndexOf(".") + 1).toLowerCase();
        if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
            out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。"));
            return;
        }

        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
        File uploadFile = new File(savePath, newFileName);
        try{
            FileUtil.copyFile(imgFile, uploadFile);
        }catch(Exception e){
            out.println(getError("上传文件失败。"));
            return;
        }

        JSONObject obj = new JSONObject();
        obj.put("error", 0);
        //bug
        obj.put("url", saveUrl + newFileName);
        out.println(obj.toString());
    }


    private String getError(String message) {
        JSONObject object = new JSONObject();
        object.put("error", 1);
        object.put("message", message);

        return object.toString();
    }

    public String getImgWidth() {
        return imgWidth;
    }

    public void setImgWidth(String imgWidth) {
        this.imgWidth = imgWidth;
    }

    public String getImgHeight() {
        return imgHeight;
    }

    public void setImgHeight(String imgHeight) {
        this.imgHeight = imgHeight;
    }

    public String getAlign() {
        return align;
    }

    public void setAlign(String align) {
        this.align = align;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public File getImgFile() {
        return imgFile;
    }

    public void setImgFile(File imgFile) {
        this.imgFile = imgFile;
    }

    public String getImgFileFileName() {
        return imgFileFileName;
    }

    public void setImgFileFileName(String imgFileFileName) {
        this.imgFileFileName = imgFileFileName;
    }
}
