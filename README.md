# The Security Game 

<img width="400" height="200" alt="Escaperoom" src="https://github.com/user-attachments/assets/01f74aac-2e81-424d-ad07-43734f11fc69" />


## Product Vision
Vår vision är att skapa ett engagerande och lärorikt terminalbaserat Escape Room‑spel som ökar medvetenheten om IT‑säkerhet på ett roligt, lättillgängligt och interaktivt sätt. Spelet ska ge spelaren praktisk erfarenhet av att identifiera hot, fatta säkra beslut och förstå grundläggande säkerhetsprinciper.

---

## Projektbeskrivning
Spelet består av flera rum med IT‑säkerhetsrelaterade utmaningar.
Spelaren navigerar genom terminalen, löser pussel, svarar på frågor och möter realistiska scenarier som:
- social engineering
- svaga lösenord
- certifikat och falska hemsidor
- ransomware
- skadliga bilagor
- misstänkta Teams‑inbjudningar

Varje rum testar en specifik säkerhetsprincip och bidrar till spelarens totala poäng.

---

## Spelet använder
- ett terminalbaserat gränssnitt i PowerShell
- modulbaserad struktur för UI, speldata och rum
- ett GameState‑objekt som håller reda på:
   - poäng
   - använda hints
   - antal misstag
   - svårighetsgrad
   - spelarnamn
   - avklarade rum
- en meny för att starta nytt spel, ladda sparat spel eller avsluta
- flera rum med interaktiva IT‑säkerhetsutmaningar
- en slutskärm med säkerhetsbedömning baserat på spelarens prestation

---

## Installation & Körning 
1. **Öppna PowerShell**
  - Tryck på Windows‑tangenten
  - Skriv PowerShell
  - Starta Windows PowerShell eller PowerShell 7
2. **Klona projektet**
```git clone https://github.com/AntonEi/the-security-game.git```
3. **Gå in i projektmappen**
```cd the-security-game```
4. **Kör spelet**
```.\Start-TheSecurityGame.ps1```
   
---

## Team och roller
- Product Owner: Anton
- Scrum Master: Gabriella
- Utvecklare: Aaren, Anna och Carlos

---

## Dokumentation (in progress)
- [Projektets wiki](https://github.com/AntonEi/the-security-game/wiki)
- [ADKAR-plan](https://github.com/AntonEi/the-security-game/wiki/ADKAR%E2%80%90plan)
- [ITIL-Continual Improvement & Service Desk](https://github.com/AntonEi/the-security-game/wiki/ITIL-%E2%80%90-Continual-Improvement-&-Service-Desk)
- [Sprint 0 - Uppstart](https://github.com/AntonEi/the-security-game/wiki/Sprint-0-%E2%80%90-Uppstart)
- [Sprint 1](https://github.com/AntonEi/the-security-game/wiki/Sprint-1)
- [Sprint 2](https://github.com/AntonEi/the-security-game/wiki/Sprint-2)
- [Sprint 3](https://github.com/AntonEi/the-security-game/wiki/Sprint-3)
