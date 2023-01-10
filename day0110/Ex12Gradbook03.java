package day0110;
/*
 1. 5명의 학생의 성적을 관리하는 프로그램을 작성하시오.
    단, 5명을 모두 입력한 후에는 더이상 입력할 수 없도록 코드를 작성하시오.
 2. 5명의 학생 성적을 관리하는 프로그램을 작성하시오.
     단, 5명을 모두 입력한 후에 새로운 학생 정보를 입력할 시에는
     가장 오래된 기록을 제거하고 새로운 학생 정보를 입력되도록 코드를 작성하시오.
 */

import util.Scannerutil;

import java.util.Scanner;

public class Ex12Gradbook03 {

    public static final int STUDENT_NUMBERS = 2;
    public static final Scanner SCANNER = new Scanner(System.in);
    public static int[]id = new int[STUDENT_NUMBERS];
    public static String[]name = new String[STUDENT_NUMBERS];
    public static int[]korean = new int[STUDENT_NUMBERS];
    public static int[]english = new int[STUDENT_NUMBERS];
    public static int[]math = new int[STUDENT_NUMBERS];
    public static void main(String[] args) {

        // 1
//        insertInfo();
//        printInfo();


        // 2
        insertInfo();
        while(true){
            int n = Scannerutil.nextInt(SCANNER,"1. 새로운 학생 정보 입력 2. 종료");
            if(n==1){
                overInfo();
            } else{
                break;
            }
        }
        printInfo();


    }

    public static void insertInfo(){
        String message = "5명의 학생 정보를 입력하시오.";
        System.out.println(message);
        for(int i = 0;i<STUDENT_NUMBERS;i++){
            System.out.printf("# %d번째 학생\n",i+1);
            message = "id를 입력하시오.";
            id[i] = Scannerutil.nextInt(SCANNER,message);
            message = "이름을 입력하시오.";
            name[i] = Scannerutil.nextLine(SCANNER,message);
            message = "국어 점수를 입력하시오.";
            korean[i] = Scannerutil.nextInt(SCANNER,message);
            message = "영어 점수를 입력하시오.";
            english[i] = Scannerutil.nextInt(SCANNER,message);
            message = "수학 점수를 입력하시오.";
            math[i] = Scannerutil.nextInt(SCANNER,message);
            if(i==STUDENT_NUMBERS-1){
                System.out.println("학생 정보를 모두 입력하셨습니다.");
            }
        }


    }
    public static void overInfo(){
        for(int i=1;i<STUDENT_NUMBERS;i++){
            id[i-1] = id[i];
            name[i-1] = name[i];
            korean[i-1] = korean[i];
            english[i-1] = english[i];
            math[i-1] = math[i];
        }
        id[STUDENT_NUMBERS-1]=Scannerutil.nextInt(SCANNER,"새로운 학생 번호를 입력하시오.");
        name[STUDENT_NUMBERS-1]=Scannerutil.nextLine(SCANNER,"새로운 학생 이름을 입력하시오.");
        korean[STUDENT_NUMBERS-1]=Scannerutil.nextInt(SCANNER,"새로운 학생 국어점수를 입력하시오.");
        english[STUDENT_NUMBERS-1]=Scannerutil.nextInt(SCANNER,"새로운 학생 영어점수를 입력하시오.");
        math[STUDENT_NUMBERS-1]=Scannerutil.nextInt(SCANNER,"새로운 학생 수학점수를 입력하시오.");

    }

    public static void printInfo(){
        System.out.println("5명의 학생 정보");
        int [] calsum = calSum();
        double [] calmean = calMean();
        for(int i=0;i<STUDENT_NUMBERS;i++){
            System.out.printf("# %d번째 학생 정보",i+1);
            System.out.println("번호: "+id[i]);
            System.out.println("이름: "+name[i]);
            System.out.printf("국어점수: %d, 영어점수: %d, 수학점수: %d\n",korean[i],english[i],math[i]);
            System.out.printf("총점: %d, 평균: %.2f\n",calsum[i],calmean[i]);


        }
    }

    public static int[] calSum(){
        int[]sum = new int[STUDENT_NUMBERS];
        for(int i=0;i<STUDENT_NUMBERS;i++){
            sum[i]=korean[i]+english[i]+math[i];
        }
        return sum;
    }
    public static double[] calMean(){
        double[] mean = new double[STUDENT_NUMBERS];
        for(int i=0;i<STUDENT_NUMBERS;i++){
            mean[i]=(korean[i]+english[i]+math[i])/(double)STUDENT_NUMBERS;
        }
        return mean;
    }
}
