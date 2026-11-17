#!/usr/bin/env python3
"""Menyusun dev/cakupan_r4ds.md dari dev/generator/cakupan_bab*.py."""
import glob
import importlib.util
import os

AKAR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
KELAS = {
    'A': 'Didukung langsung',
    'B': 'Didukung setelah lokalisasi sistematis',
    'C': 'Perlu penyesuaian terdokumentasi',
    'D': 'Di luar lingkup',
}


def muat(path):
    spec = importlib.util.spec_from_file_location('bab', path)
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    return m


def main():
    bab = sorted(glob.glob(os.path.join(os.path.dirname(__file__), 'cakupan_bab*.py')))
    out = ['# Laporan cakupan R4DS 2e, Bagian I (The Whole Game)', '',
           'Tiap contoh dan latihan dikelompokkan ke satu kelas. Uji yang menjalankannya ada di `tests/testthat/test-r4ds-babNN.R`: contoh dijalankan dalam bentuk asli dan bentuk lokal, lalu hasilnya dibandingkan.', '',
           '| Kelas | Arti |', '|---|---|'] + ['| %s | %s |' % (k, v) for k, v in KELAS.items()] + ['']
    total = {k: 0 for k in KELAS}
    ringkas = []
    for path in bab:
        m = muat(path)
        out += ['## Bab %d. %s' % (m.BAB, m.JUDUL), '', '| Bagian | Contoh buku | Padanan lokal | Kelas | Uji | Catatan |', '|---|---|---|---|---|---|']
        hitung = {k: 0 for k in KELAS}
        for b, asli, lokal, kelas, uji, cat in m.BARIS:
            out.append('| %s | %s | %s | %s | %s | %s |' % (b, asli, lokal, kelas, uji, cat))
            hitung[kelas] += 1
        for k in KELAS:
            total[k] += hitung[k]
        ringkas.append((m.BAB, m.JUDUL, hitung))
        out.append('')
    out += ['## Ringkasan', '', '| Bab | ' + ' | '.join(KELAS) + ' | Jumlah |', '|---|' + '---|' * (len(KELAS) + 1)]
    for no, judul, h in ringkas:
        out.append('| %d. %s | %s | %d |' % (no, judul, ' | '.join(str(h[k]) for k in KELAS), sum(h.values())))
    out.append('| **Total** | %s | %d |' % (' | '.join(str(total[k]) for k in KELAS), sum(total.values())))
    out += ['', 'Bab yang belum ada di tabel ini belum diaudit (Phase 4 dikerjakan per bab).', '']
    open(os.path.join(AKAR, 'dev', 'cakupan_r4ds.md'), 'w', encoding='utf-8').write('\n'.join(out))
    print('Total:', total)


if __name__ == '__main__':
    main()
