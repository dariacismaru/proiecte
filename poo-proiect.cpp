#define _CRT_SECURE_NO_WARNINGS
#include<iostream>
#include<string>
using namespace std;
class FIRMA
{
private:
	const string adresa;
	char* denumire = nullptr;
	int nr_angajati = 0;
	bool esteInchisa = false;
public:

	bool getEste()
	{
		return esteInchisa;
	}

	int getNrAng()
	{
		return nr_angajati;
	}

	string getAdresa()
	{
		return adresa;
	}
	//constructorul default
	FIRMA() :adresa("Aviatorilor")
	{



	}
	//constrctorul cu un parametru
	FIRMA(string abc) :adresa(abc) {}

	//constrctorul cu toti parametrii 
	FIRMA(string adresa, const char* denumire, int nr_angajati, bool esteInchisa) :adresa(adresa)
	{
		// adresa este obligatorie
		// daca am char* se doreste ca valoarea sa ramane nemodificata
		this->esteInchisa = esteInchisa;
		this->denumire = new char[strlen(denumire) + 1];
		memcpy(this->denumire, denumire, strlen(denumire) + 1);
		this->nr_angajati = nr_angajati;

	}


	void setDenumire(const char* denum)
	{
		delete[] denumire;
		denumire = new char[strlen(denum) + 1];
		strcpy(denumire, denum);
	}

	char* getDenumire()
	{
		return denumire;
	}

	//constructorul de copiere
	FIRMA(const FIRMA& copie) :adresa(copie.adresa)
	{
		//se va trimite o referinta care ne va putea ajuta sa copiem valorile;
		//nu am voie sa umblu la adresa deoarece este const
		this->denumire = new char[strlen(copie.denumire) + 1];
		memcpy(this->denumire, copie.denumire, strlen(copie.denumire) + 1);
		this->nr_angajati = copie.nr_angajati;
		this->esteInchisa = copie.esteInchisa;
	}
	//supraincarcarea =
	// in operatorul = nu am voie sa copiez constantele
	void operator=(const FIRMA& copie)
	{
		this->esteInchisa = copie.esteInchisa;
		this->nr_angajati = copie.nr_angajati;
		if (this->denumire)
			delete[]this->denumire;
		this->denumire = nullptr;
		if (copie.denumire)
		{
			//deep copy --aloc memorie pt denumire
			this->denumire = new char[strlen(copie.denumire) + 1];
			memcpy(this->denumire, copie.denumire, strlen(copie.denumire) + 1);
		}
		else
		{
			this->denumire = nullptr;
		}
	}
	//pentru operatorul *=
	void operator*=(int nr_angajati)
	{
		this->nr_angajati *= nr_angajati;
	}
	// pentru operatorul +=
	void operator+=(int nr_angajati)
	{
		this->nr_angajati += nr_angajati;
	}
	//pentru operatorul >=
	// comentez/verific pe copie 
	bool operator<=(const FIRMA& copie)
	{
		return this->nr_angajati <= copie.nr_angajati;
	}

	~FIRMA()
	{
		delete[] denumire;
	}
};

void afisare_firma(FIRMA& firma)
{
	cout << endl << "afisare firma:";
	cout << endl << "firma are adresa:" << firma.getAdresa();
	cout << endl << "firma se numeste:" << firma.getDenumire();

	cout << endl << "angajatii firmei sunt in numar de:" << firma.getNrAng();
	if (firma.getEste())
	{
		cout << endl << "firma este inchisa!";
	}
	else
	{
		cout << endl << "firma este deschisa!";
	}
	cout << endl;
}

int main()
{
	FIRMA firma;
	FIRMA firma2("Unirii", "Alfha", 450, true);
	firma.setDenumire("gamma");
	afisare_firma(firma);
	afisare_firma(firma2);
	FIRMA firma3 = firma2;
	afisare_firma(firma3);
	firma3 = firma;
	afisare_firma(firma3);
	firma2 *= 3;
	afisare_firma(firma2);
	firma2 += 10000;// a luat rezultatul de mai sus dupa inmultirea cu 3 si la adunat cu valoarea respectiva
	afisare_firma(firma2);
	if (firma2 <= firma3)
	{
		cout << endl << " firma2 are mai putini angajati decat firma3";

	}
	else
	{
		cout << endl << "firma3 are mai putini angajati decat firma2";
	}

	return 0;

}






