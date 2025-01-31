
using UnityEngine;


namespace OOP
{
    public interface Int
    {
        int Add();
    }
    public interface Int2
    {
        int Add();
    }
    public abstract class Ac
    {
        public Ac()
        {

        }
        public int number = 10;
        public  int  Add()
        {
            return number + number;
        }
    }
    public abstract class Weapon
    {
        public Weapon()
        {

        }
        public int number = 10;
        public int Add()
        {
            return number + number;
        }
    }
    public class Rc : Ac, Int, Int2
    { 
        public Rc()
        {

        }
      
    }
    public class Lessons_OOP : MonoBehaviour
    {
        //OOP
        //����������: ����������� ��������� �������� ���������� � �������

        //������������ ������: �������� � ������ ��������������� � ���� ������� � ������ �� �������� �������.

        //������������: �������� � ������ ����� ���� ������������ ����� ������� �� ������� ������

        //�����������: ��������� ���� - ������� ����� ��������� ��������� ����� � ����������� �� �� �������������

        //SOLID:

        //Single Responsibility Principle(������� ������������ �����������)

        //Open/Closed Principle(������� ����������/����������)

        //Liskov Substitution Principle(������� ����������� ������)

        //Interface Segregation Principle(������� ���������� �����������)

        //Dependency Inversion Principle(������� �������� ������������)
    }
}

