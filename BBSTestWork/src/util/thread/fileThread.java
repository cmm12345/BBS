package util.thread;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class fileThread extends Thread{
	private String sourcePath;
	private String path;
	
	public String getSourcePath() {
		return sourcePath;
	}
	public void setSourcePath(String sourcePath) {
		this.sourcePath = sourcePath;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public fileThread() {
		super();
	}
	public fileThread(String sourcePath, String path) {
		this.sourcePath = sourcePath;
		this.path = path;
	}
	public  void run() {
		try {
			copyDir(sourcePath, path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void copyDir(String oldPath, String newPath) throws IOException{
        File file = new File(oldPath);
        String[] filePath = file.list();
        
        if (!(new File(newPath)).exists()){
            (new File(newPath)).mkdir();
        }
        
        for (int i = 0;i<filePath.length; i++){
	            if ((new File(oldPath + file.separator +filePath[i])).isDirectory()){
	                copyDir(oldPath+ file.separator+filePath[i],newPath+ file.separator + filePath[i]);
	                 }
	            if ((new File(oldPath + file.separator +filePath[i])).isFile()){
	            	copyFile(oldPath+ file.separator+filePath[i],newPath+ file.separator + filePath[i]);
	                 }
        }
	}
	public static void copyFile(String oldPath, String newPath) throws IOException {
        File oldFile = new File(oldPath);
        File file = new File(newPath);
        FileInputStream in = new FileInputStream(oldFile);
        FileOutputStream out = new FileOutputStream(file);;

        byte[] buffer=new byte[2097152];
        while((in.read(buffer)) != -1){
            out.write(buffer);
        }
    
        
    }



	
}
