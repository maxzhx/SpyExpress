package com.spy.action;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Id;

public class Dijkstra {

	private static int maxnum = 1000000;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
	}
	
	public static List<Integer> DijkstraPath(int n,int sourceid,int destid,int c[][],int id[])
	{
		int source = 0;
		int dest = 0;
		for(int i = 1;i<=n;i++)
		{
			if(id[i] == sourceid)
			{
				source = i;
				break;
			}
		}
		for(int i = 1;i<=n;i++)
		{
			if(id[i] == destid)
			{
				dest = i;
				break;
			}
		}
	    int dist[] = new int[n+1];
	    int prev[] = new int[n+1];
		boolean s[] = new boolean[n+1];
		for(int i=1;i<=n;i++)
		{
			dist[i] = c[source][i];
			s[i] = false;
			if(dist[i] == maxnum)
				prev[i] = 0;
			else {
				prev[i] = source;
			}
		}
		dist[source] = 0;
		s[source] = true;
		for (int i = 1; i < n; i++) {
			int temp = maxnum;
			int u = source;
			for (int j = 1; j <=n; j++) {
				if((!s[j])&&(dist[j]<temp))
				{
					u = j;
					temp = dist[j];
				}
			}
			s[u] = true;
			for (int j = 1; j <= n; j++) {
				if((!s[j])&&c[u][j]<maxnum)
				{
					int newdist = dist[u] + c[u][j];
					if(newdist < dist[j])
					{
						dist[j] = newdist;
						prev[j] = u;
					}
				}
				
			}
		}
		for (int i = 0; i < n; i++) {
			System.out.println(prev[i]);
		}
		List<Integer> path = new ArrayList<Integer>();
		List<Integer> newpath = new ArrayList<Integer>();
		int x=0;
		while(true)
		{
			int nowstation = dest;
			path.add(x++,dest);
			System.out.println(dest);
			dest = prev[nowstation];
			if(dest == source)
				break;
		}
		path.add(source);
		for(int i=path.size()-1 ; i>=0; i-- ){
			newpath.add(id[path.get(i)]); 
		}
		return newpath;
	}

}
