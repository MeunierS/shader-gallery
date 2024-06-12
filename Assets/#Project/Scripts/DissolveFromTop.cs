using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DissolveFromTop : MonoBehaviour
{
    Renderer rend;
    [SerializeField]ParticleSystem particles;
    [SerializeField]float dissolveTime = 2f;
    float dissolve;
    public float Dissolve { 
        get{
            return dissolve;
        } 
        set{
            value = Mathf.Clamp01(value);
            rend.material.SetFloat("_Dissolve", value);
            particles.transform.position = Vector3.Lerp(rend.bounds.center + Vector3.up * rend.bounds.extents.y,
                rend.bounds.center + Vector3.down * rend.bounds.extents.y,
                value);
            dissolve = value;
        }
        }

    // Start is called before the first frame update
    void Start()
    {
        rend = GetComponent<Renderer>();
        StartDissolve();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void StartDissolve(){
        StartCoroutine(DoDissolve());
    }
    //coroutine
    IEnumerator DoDissolve(){
        float timer = 0f;
        particles.Play();
        while(timer < dissolveTime){
            Dissolve= timer / dissolveTime;
            timer+= Time.deltaTime;
            yield return null;
        }
        Dissolve= 1;
        particles.Stop();
    }
}
