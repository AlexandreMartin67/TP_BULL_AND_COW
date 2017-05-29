unit bulls_and_cows;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tbull_and_cow = class(TForm)
    lettres_7: TButton;
    nb_lettre: TLabel;
    RESET: TButton;
    QUITTER: TButton;
    edit_texte: TEdit;
    edit_nb_lettre: TEdit;
    Label_texte: TLabel;
    bulls_and_cow: TLabel;
    liste_mot: TMemo;
    memo_cow: TMemo;
    memo_bull: TMemo;
    Panel_menu: TPanel;
    Menu: TLabel;
    ESSAIE: TButton;
    Panel_jeu: TPanel;
    lettres_6: TButton;
    lettres_5: TButton;
    lettres_4: TButton;
    lettres_3: TButton;
    game: TLabel;
    label_nombre_essaie: TLabel;
    edit_nb_essaie: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure debut_du_jeu(Sender: TObject);
    procedure lettres_3Click(Sender: TObject);
    procedure lettres_4Click(Sender: TObject);
    procedure lettres_5Click(Sender: TObject);
    procedure lettres_6Click(Sender: TObject);
    procedure lettres_7Click(Sender: TObject);
    procedure ESSAIEClick(Sender: TObject);
    procedure QUITTERClick(Sender: TObject);
    procedure recommencer(Sender: TObject);
    procedure RESETClick(Sender: TObject);
    function verification_mot(Sender :TObject):boolean;
    procedure exam_mots (Sender:TObject);
    procedure echec (Sender:TObject);
    procedure win (Sender :TObject) ;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

Const
  nb_essaies_3lettre = 4;
  nb_essaies_4lettre = 7;
  nb_essaies_5lettre = 10;
  nb_essaies_6lettre = 16;
  nb_essaies_7lettre = 20;
  alphabet = 'abcdefghijklmnopqrstuvwxyz';

var
  bull_and_cow: Tbull_and_cow;
  nb_lettres : integer;
  mots_a_trouver:string;
  nb_essaies : integer;
  bull : integer;
  cow : integer;

implementation

{$R *.dfm}


function Tbull_and_cow.verification_mot(Sender: TObject):boolean;
{
but : verifie chaque lettre du mot et la compare pour savoir si le mots entrée par l'utilisateur est correct
entrée : le mots à trouver , le mots entrée par l'utilisateur , une constante avec l'alphabet
sortie : une variable boolean qui dit si le mot entrée est valide ou non
}
var
  mots_valide:boolean;
  I: Integer;
  Y: Integer;
  compteur :integer;
begin
  compteur:=0;
  mots_valide:=true;
  if length(edit_texte.Text)<> nb_lettres then
    mots_valide:=false;
  for I := 1 to length(edit_texte.Text) do
    for Y := 1 to length(edit_texte.Text) do
      if ((edit_texte.Text[i] = edit_texte.Text[Y]) AND (I <> Y)) then
        mots_valide:=false;
  for I := 1 to length(edit_texte.Text) do
      for Y := 1 to length(alphabet) do
        if edit_texte.Text[i] = alphabet[y] then
          compteur:=compteur+1;
  if compteur<>length(edit_texte.Text) then
    mots_valide:=false;
  result:=mots_valide;
end;

procedure Tbull_and_cow.recommencer(Sender: TObject);
{
but : permet de reset complétement le jeu en permettant a l'utilisateur de recommencer le jeu
entrée :
sortie : tout les edits et les memos sont effacer et on affiche a nouveau l'écran menu
}
begin
  edit_texte.Text:='';
  edit_nb_lettre.Text:='';
  edit_nb_essaie.Text:='';
  RESET.Enabled:=false;
  ESSAIE.Enabled:=false;
  edit_texte.ReadOnly:=true;
  Panel_menu.Visible:=true;
  memo_cow.Lines.Text:='';
  memo_bull.Lines.Text:='';
end;

procedure Tbull_and_cow.RESETClick(Sender: TObject);
{
but : demande à l'ulisateur si il veut recommencer et si oui appel la méthode "recommencer"
entrée : imput utilisateur
sortie : appel ou non la méthode "recomencer"
}
begin
   with application do
  begin
    NormalizeTopMosts;
    if(messageBox('voulez vous recommencer','recommencer',MB_YESNO)=IDYES)then
    recommencer(Sender);

    RestoreTopMosts;
  end;

end;

procedure Tbull_and_cow.exam_mots(Sender: TObject);
{
but : appel la méthode "verif_mots" pour verfié que le mot entrée correspond bien puis ensuite analyse chaque lettre du mot entrée et la compare par rapport au mot a trouver .
entrée : mot a trouver , mot entrée par l'utilisateur , variable cow et bull
sortie : message d'erreur de saissie ou les variable bull et cow vont dans le "memo_bull" et "memo_cow"
}
var
  I: Integer;
  Y: Integer;

begin
  if verification_mot(Sender) = true Then
    Begin
      bull:=0;
      cow:=0;
      for I := 1 to length(edit_texte.Text) do
        begin
          if edit_texte.Text[i]= mots_a_trouver[i] then
            bull := bull+1
          else
            for Y := 1 to length(edit_texte.Text) do
              begin
                if edit_texte.Text[i]= mots_a_trouver[y] then
                  cow := cow+1;
              end;
        end;
      nb_essaies := nb_essaies-1;
      edit_nb_essaie.Text:=inttostr(nb_essaies);
      memo_cow.Lines.Add(inttostr(cow));
      memo_bull.Lines.Add(inttostr(bull));
    End
  else
    Begin
      showmessage('attention mots incorect');
      edit_texte.Text:='';
    End;
end;
procedure Tbull_and_cow.ESSAIEClick(Sender: TObject);
{
but : appel la procedure "exam_mots" puis appel la procedure "win" et "perdu" pour definir si le joueur a fini le jeu
entrée :
sortie : actualisation du nombre d'essaie , du "memo_bull" et "memo_cow" ou message de fin de jeu
}

begin
  exam_mots(Sender);
  echec(Sender);
  win(Sender);
end;

procedure Tbull_and_cow.FormCreate(Sender: TObject);
{
but : génération de l'aléatoire et chargement de de la liste de mots
entrée :
sortie : la liste de mots va dans le memo "liste_mot"
}
begin
  randomize;
  liste_mot.lines.LoadFromFile('mots.txt');
end;

procedure Tbull_and_cow.debut_du_jeu(Sender: TObject);
{
but : cherche dans la liste de mot , un mots avec la bonne taille
entrée :
sortie : le mot a trouver qui correspond a la bonne taille de lettres
}
var
  alea:integer;

begin
  alea:=random(2);
  panel_menu.Visible:=false;
  panel_jeu.Visible:=true;
  edit_nb_lettre.Text:=inttostr(nb_lettres);
  edit_nb_essaie.Text:=inttostr(nb_essaies);
  ESSAIE.Enabled:=true;
  RESET.Enabled:=true;
  edit_texte.ReadOnly:=false;
  case nb_lettres of
    3:begin
      if alea=1 then mots_a_trouver:=copy(liste_mot.Lines.Text,1,3)
        else mots_a_trouver:=copy(liste_mot.Lines.Text,4,3);
    end;
    4:begin
      if alea=1 then mots_a_trouver:=copy(liste_mot.Lines.Text,7,4)
        else mots_a_trouver:=copy(liste_mot.Lines.Text,11,4);
    end;
    5:begin
      if alea=1 then mots_a_trouver:=copy(liste_mot.Lines.Text,15,5)
        else mots_a_trouver:=copy(liste_mot.Lines.Text,20,5);
    end;
    6:begin
      if alea=1 then mots_a_trouver:=copy(liste_mot.Lines.Text,25,6)
        else mots_a_trouver:=copy(liste_mot.Lines.Text,31,6);
    end;
    7:begin
      if alea=1 then mots_a_trouver:=copy(liste_mot.Lines.Text,37,7)
        else mots_a_trouver:=copy(liste_mot.Lines.Text,44,7);
    end;
  end;
end;

procedure Tbull_and_cow.lettres_3Click(Sender: TObject);
{
but : modifie la variable  "nb_lettre" en fonction du bouton entrée par l'utilisateur , configure le nombre d'essaie puis appel "debut_jeu"
entrée : imput utilisateur
sortie : le mot a trouver qui correspond a la bonne taille de lettres
}
var
begin
  nb_lettres:=3;
  nb_essaies:=nb_essaies_3lettre;
  debut_du_jeu(Sender);
end;

procedure Tbull_and_cow.lettres_4Click(Sender: TObject);
{
but : modifie la variable  "nb_lettre" en fonction du bouton entrée par l'utilisateur , configure le nombre d'essaie puis appel "debut_jeu"
entrée : imput utilisateur
sortie : le mot a trouver qui correspond a la bonne taille de lettres
}
begin
  nb_lettres:=4;
    nb_essaies:=nb_essaies_4lettre;
  debut_du_jeu(Sender);
end;

procedure Tbull_and_cow.lettres_5Click(Sender: TObject);
{
but : modifie la variable  "nb_lettre" en fonction du bouton entrée par l'utilisateur , configure le nombre d'essaie puis appel "debut_jeu"
entrée : imput utilisateur
sortie : le mot a trouver qui correspond a la bonne taille de lettres
}
begin
  nb_lettres:=5;
  nb_essaies:=nb_essaies_5lettre;
  debut_du_jeu(Sender);
end;

procedure Tbull_and_cow.lettres_6Click(Sender: TObject);
{
but : modifie la variable  "nb_lettre" en fonction du bouton entrée par l'utilisateur , configure le nombre d'essaie puis appel "debut_jeu"
entrée : imput utilisateur
sortie : le mot a trouver qui correspond a la bonne taille de lettres
}
begin
  nb_lettres:=6;
  nb_essaies:=nb_essaies_6lettre;
  debut_du_jeu(Sender);
end;

procedure Tbull_and_cow.lettres_7Click(Sender: TObject);
{
but : modifie la variable  "nb_lettre" en fonction du bouton entrée par l'utilisateur , configure le nombre d'essaie puis appel "debut_jeu"
entrée : imput utilisateur
sortie : le mot a trouver qui correspond a la bonne taille de lettres
}
begin
  nb_lettres:=7;
  nb_essaies:=nb_essaies_7lettre;
  debut_du_jeu(Sender);
end;

procedure Tbull_and_cow.QUITTERClick(Sender: TObject);
{
but : demende a l'utilisateur si il veut quitter la partie
entrée : imput utilisateur
sortie : quiite le jeu et ferme le programme
}
begin
  with application do
  begin
    NormalizeTopMosts;
    if(messageBox('voulez vous quitter','Quitter',MB_YESNO)=IDYES)then
    close;

    RestoreTopMosts;
  end;

end;

procedure Tbull_and_cow.echec(Sender: TObject);
{
but : examine le nombre d'essaie et définit si le joueur perd la partie
entrée :
sortie : affiche un message perdu et appel"recommencer" si l'ilisateur n'a plus d'essaie
}
begin
  if nb_essaies = 0 then
    begin
      showmessage('vous avez perdu');
      recommencer(Sender);
    end;

end;

procedure Tbull_and_cow.win(Sender: TObject);
{
but : examine le nombre de bull(lettre bien placer) et définit si le joueur gagne la partie
entrée :
sortie : affiche un message gagné et appel"recommencer" si l'ilisateur a autant de bull que de lettre dans le mot a trouver
}
begin
  if bull = length(mots_a_trouver) then
     begin
      showmessage('vous avez gagné');
      recommencer(Sender);
    end;

end;
end.
