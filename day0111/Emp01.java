package day0111;


import util.ScannerUtil;

import java.util.Scanner;

public class Emp01 {

    public static final int STUDENT_SIZE = 5;
    public static final int SCORE_MIN = 0;
    public static final int SCORE_MAX = 100;
    public static final Scanner SCANNER = new Scanner(System.in);

    public static Student[] studentArray= new Student[STUDENT_SIZE];

    public static void main(String[] args) {
        showMenu();

        SCANNER.close();
    }

    public static void showMenu(){
        while(true){
            Student s = new Student();
            String message = "1. 입력 2. 출력 3. 종료";
            int userChoice = ScannerUtil.nextInt(SCANNER,message);

            if(userChoice==1){
                insertStudent();
            } else if (userChoice==2) {
                s.print();
            } else if (userChoice==3) {
                System.out.println("사용해주셔서 감사합니다.");
                break;
            }
        }
    }

    public static void insertStudent() {
        int index = findNextIndex();
        if(index==-1) {
//            System.out.println("더이상 저장할 수 없습니다."); // 1번문제
            moveElement();
            index = 4;
//        } else { // 1번 문제
        }
            Student s = new Student();
            String message;

            message = "학생의 번호를 입력해주세요.";
            s.setId(ScannerUtil.nextInt(SCANNER,message));

            message = "학생의 이름을 입력해주세요.";
            s.setName(ScannerUtil.nextLine(SCANNER,message));

            message = "학생의 국어점수를 입력해주세요.";
            s.setKorean(ScannerUtil.nextInt(SCANNER,message,SCORE_MIN,SCORE_MAX));

            message = "학생의 영어점수를 입력해주세요.";
            s.setEnglish(ScannerUtil.nextInt(SCANNER,message,SCORE_MIN,SCORE_MAX));

            message = "학생의 수학점수를 입력해주세요.";
            s.setMath(ScannerUtil.nextInt(SCANNER,message,SCORE_MIN,SCORE_MAX));

            studentArray[index] = s;
    }


    public static void moveElement() {
        for(int i = 0;i< studentArray.length-1;i++){
            studentArray[i]=studentArray[i+1];
        }
    }

    public static int findNextIndex() {
        for(int i=0;i< studentArray.length;i++){
            if(studentArray[i]==null) return i;
        }
        return -1;
    }
/*
    public static void printStudent() {
        if(findNextIndex()==0){
            System.out.println("아직 입력된 학생이 존재하지 않습니다.");
        } else{
            int lastIndex = findNextIndex();
            if(lastIndex==-1){
                lastIndex = 5;
            }
            for(int i=0;i<lastIndex;i++){
                Student s = studentArray[i];
                System.out.println("번호: "+ s.getId() );
                System.out.println("이름: "+ s.getName() );
                System.out.println("국어: "+ s.getKorean() );
                System.out.println("영어: "+ s.getEnglish() );
                System.out.println("수학: "+ s.getMath() );
            }
        }

    }
*/



    /*
    // sol 2
    public static final int STUDENT_NUMBERS = 5;
    public static final Scanner SCANNER = new Scanner(System.in);
    public static int[]id = new int[STUDENT_NUMBERS];
    public static String[]name = new String[STUDENT_NUMBERS];
    public static int[]korean = new int[STUDENT_NUMBERS];
    public static int[]english = new int[STUDENT_NUMBERS];
    public static int[]math = new int[STUDENT_NUMBERS];
    public static final int OBJECT_NUM = 3;
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
            mean[i]=(korean[i]+english[i]+math[i])/(double)OBJECT_NUM;
        }
        return mean;
    }



     */
}
