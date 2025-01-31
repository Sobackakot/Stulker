
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
        //Абстракция: абстрактное поведение объектов обобщается в классах

        //Инкапсуляция данных: свойства и методы инкапсулируются в виде классов и скрыты от внешнего доступа.

        //Наследование: свойства и методы могут быть унаследованы одним классом от другого класса

        //Полиморфизм: множество форм - объекты могут принимать различные формы в зависимости от их использования

        //SOLID:

        //Single Responsibility Principle(Принцип единственной обязанности)

        //Open/Closed Principle(Принцип открытости/закрытости)

        //Liskov Substitution Principle(Принцип подстановки Лисков)

        //Interface Segregation Principle(Принцип разделения интерфейсов)

        //Dependency Inversion Principle(Принцип инверсии зависимостей)
    }
}

