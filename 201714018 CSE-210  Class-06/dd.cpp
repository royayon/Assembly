#include<iostream>
using namespace std;
int main()
{
    int n;
    cin>>n;
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=n-i;j++)
            cout<<" ";
        int cnt=0;
        int p=i;
        for(int j=1;j<=2*i-1;j++)
        {
            cout<<p;
            cnt++;


            if(cnt>(2*i-1)/2)
                p--;
            else
                p++;





        }
        cout<<endl;
    }
}
