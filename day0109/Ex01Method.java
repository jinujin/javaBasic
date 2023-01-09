package day0109;

public class Ex01Method {
    public static void main(String[] args) {
        printIntro();
        printBigger(3,4);
        printBigger(4,3);
        printBigger(4,4);


        int a = 5;
        int b = 3;
        int result = calculatePower(a,b);
//        System.out.println("a의 b승: "+result);
        System.out.println(a+"의 "+b+"승 :"+result);

        a = 4;
        b = 4;
//        int result = calculatePower(a,b);
//        System.out.println("a의 b승: "+result);
        System.out.println(a+"의 "+b+"승 :"+calculatePower(4,4));
    }

    public static void printIntro(){
        System.out.println("Ex01Method");
        System.out.println("작성자: 김진우");
        System.out.println("작성일: 2023년 01월 09일");
        System.out.println("내용: 메소드에 대한 설명 및 예제");
    }

    public static void printBigger(int a,int b){
        if(a>b){
            System.out.println("a가 더 크다.");
        } else{
            System.out.println("b가 더 크거나 같다.");
        }
    }

    public static int calculatePower(int a, int b){
        int result =1;
        for (int i=1;i<=b;i++) result *= a;

        return result;
    }
}
