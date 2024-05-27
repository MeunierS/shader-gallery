using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjectDissolve : MonoBehaviour
{
    Material material;
    public float dissolveTime = 2f;

    // Start is called before the first frame update
    void Start()
    {
        material = GetComponent<Renderer>().material;
        //StartDissolve();
        Invoke("StartDissolve", 5f);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void StartDissolve(){
        StartCoroutine(Dissolve());
    }
    //coroutine
    IEnumerator Dissolve(){
        float timer = 0f;
        //yield return new WaitForSeconds(1f);
        while(timer < dissolveTime){
            material.SetFloat("_Dissolve", timer / dissolveTime);
            timer+= Time.deltaTime;
            yield return null;
        }
        material.SetFloat("_Dissolve", 1.5f);
    }
}
