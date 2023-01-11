package util;
// 배열을 사용할 때 도움이 될만한 static 메소드를 모아둔 ArrayUtil 클래스
public class ArrayUtil {
    // 1. int[]
    // A. size() => 현재 배열의 길이를 반환
    public static int size(int[] array){
        return array.length;
    }
    // B. isEmpty()
    public static boolean isEmpty(int[] array){
        return size(array) == 0;
    }
    // C. get()
    public static int get(int[] array,int index){
        return array[index];
    }

    // D. contains() => 중복 제거
    public static boolean contains(int[] array, int element){
        for(int i =0 ; i< size(array);i++){
            if(element == get(array,i)){
                return true;
            }
        }
        return false;
    }
    //E. indexOf()
    public static int indexOf(int[] array, int element){
        for(int i =0;i<size(array);i++){
            if(element == get(array,i)){
                return i;
            }
        }
        return -1;
    }
    // F. add()
    public static int[] add(int[] array, int element){
        int[] temp = new int[size(array)+1];
        for(int i =0;i<size(array);i++){
            temp[i] = get(array,i);
        }
        temp[size(array)] = element;

        return temp;
    }
    // G. add()
    public static int[] add(int[] array, int index, int element){
        // sol1
        int [] temp = new int[size(array)+1];
        for(int i =0;i<index;i++){
            temp[i]= get(array,i);
        }
        temp[index] = element;
        for(int i =index;i<size(array);i++){
            temp[i+1] = get(array,i);
        }
        // sol2
        temp = new int[0];
        for(int i=0;i<size(array);){
            if(i != index){
                temp = add(temp, get(array,i));
                i++;
            } else {
                temp = add(temp,element);
            }
        }
        return temp;
    }

    // H. set()
    public static int set(int[]array, int index, int element){
        int original = get(array,index);
        array[index] = element;

        return original;
    }

    // I. removeByIndex()
    public static int[] removeByIndex(int[]array, int index){
        int[] temp = new int[0];
        for(int i = 0; i < size(array);i++){
            if(i != index){
                temp = add(temp,get(array,i));
            }
        }
        return temp;
    }

    // J. removeByElement
    public static int[] removeByElement(int[]array, int element){
        return removeByIndex(array,indexOf(array,element));
    }

    // K. sort() => 정렬
    public static void sort(int[] array){
        for(int i =0; i< array.length-1;i++){
            if(array[i]>array[i+1]){
                int temp = array[i];
                array[i] = array[i+1];
                array[i+1] = temp;
                i = -1;
            }
        }
    }
    // Object ArrayUtil
    // size, isEmpty, get, contains, indexOf, add, add, set, removeIndex, removeElement, sort
    public static int size(Object[] o){
        return o.length;
    }
    public static boolean isEmpty(Object[] o){
        return size(o) == 0;
    }
    public static Object get(Object[] o, int index){
        return o[index];
    }
    public static boolean contains(Object[] o, Object element){
        for(int i = 0;i<size(o);i++){
            if(element==get(o,i)){
                return true;
            }
        }
        return false;
    }
    public static Object indexOf(){
        return 
    }
}


