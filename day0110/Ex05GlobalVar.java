package day0110;
/*
 전역 변수(Global Variable)
 */
import util.ScannerUtil;

import java.util.Scanner;
public class Ex05GlobalVar {
    public static final Scanner SCANNER = new Scanner(System.in);
    public static final int SUBJECT_SIZE=3;
    public static final int SCORE_MIN=0;
    public static final int SCORE_MAX=100;
    public static Student student = null;
    // null : 참조형 데이터 타입에서만 나타나는 형태
    public static void main(String[] args) {
        while (true){
            String message = "1. 입력 2. 출력 3. 종류";
            int userChoice = ScannerUtil.nextInt(SCANNER,message);
            if(userChoice==1){
                insertInfo();
            } else if (userChoice == 2) {
                if(student != null){
                    printInfo();
                }else{
                    System.out.println("입력 정보 x");
                }

            } else if (userChoice == 3) {
                System.out.println("감사합니다.");
                break;
            }
        }

        SCANNER.close();
    }
    public static void insertInfo(){
        student = new Student();
        String message;

        message = "학생 번호";
        student.id = ScannerUtil.nextInt(SCANNER,message);

        message = "학생 이름";
        student.name = ScannerUtil.nextLine(SCANNER,message);
    }

    public static void printInfo(){
        System.out.println("-----------------------");
        System.out.println("학생 번호"+student.id);
        System.out.println("학생 이름"+student.name);
        System.out.println("-----------------------");
    }

}
