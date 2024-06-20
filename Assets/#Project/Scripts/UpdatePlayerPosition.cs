using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[ExecuteInEditMode]

public class UpdatePlayerPosition : MonoBehaviour
{
    public Material material;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        material.SetVector("_PlayerPosition", transform.position);
    }
}
