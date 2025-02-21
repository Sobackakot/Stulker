
using System.Collections.Generic;
using System; 

public static class EventBus
{
    private static readonly Dictionary<Type, List<Delegate>> eventDictionary = new();

    public static void Subscribe<T>(Action<T> listener)
    {
        if (!eventDictionary.ContainsKey(typeof(T)))
            eventDictionary[typeof(T)] = new List<Delegate>();

        eventDictionary[typeof(T)].Add(listener);
    }

    public static void Unsubscribe<T>(Action<T> listener)
    {
        if (eventDictionary.ContainsKey(typeof(T)))
        {
            eventDictionary[typeof(T)].Remove(listener);
            if (eventDictionary[typeof(T)].Count == 0)
                eventDictionary.Remove(typeof(T));
        }
    }

    public static void Publish<T>(T eventData)
    {
        if (eventDictionary.ContainsKey(typeof(T)))
        {
            foreach (var listener in eventDictionary[typeof(T)])
            {
                ((Action<T>)listener).Invoke(eventData);
            }
        }
    }
}
