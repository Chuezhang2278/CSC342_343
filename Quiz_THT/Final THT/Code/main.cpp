#include <iostream>
#include "dotProduct.h"
#include <immintrin.h>
#include <windows.h>

#define MAX 25 // modify this to increase of decrease vector testing

using namespace std;


int main() {
    
    __int64 controlOne = 0, controlTwo = 0, frequency = 0;
    int N = 0;


    for (int i = 3; i <= MAX; i++) {
        N = (int)pow(2, i);

        float* a = new float[N];
        float* b = new float[N];

        for (int j = 0; j < N; j++) {
            a[j] = 2;
            b[j] = 2;
        }
        
        cout << "Array Size : " << N << endl;
        if (QueryPerformanceCounter((LARGE_INTEGER*)&controlOne) != 0) {
            cout << "Dot Product Answer : " << dotProductDDPS(a, b, N) << endl;


            QueryPerformanceCounter((LARGE_INTEGER*)&controlTwo);

            //cout << "Start Value: " << controlOne << endl;
            //cout << "End Value: " << controlTwo << endl;

            QueryPerformanceFrequency((LARGE_INTEGER*)&frequency);
            //cout << "QueryPerformanceFrequency : " << frequency << " counts per Seconds." << endl;

            //cout << "QueryPerformanceCounter minimum resolution: 1/" << frequency << " seconds." << endl;

            //cout << "ctr2 - ctr1: " << ((controlTwo - controlOne) * 1.0 / 1.0) << " counts." << endl;
            cout << "Total time: " << ((controlTwo - controlOne) * 1.0 / frequency) << " seconds." << endl;
        } else {
            DWORD dwError = GetLastError();
            cout << "Error value = " << dwError << endl;
        }
        cout << endl;

    }

    return 0;
}