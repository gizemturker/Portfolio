//
//  HomePageItem.swift
//  OnePieceWalpaper
//
//  Created by Gizem Turker on 7.09.2023.
//

//
//  HomePageItem.swift
//  OnePieceWalpaper
//
//  Created by Gizem Turker on 7.09.2023.
//

import Foundation
import SwiftUI

enum HomePageItem: String, Identifiable {
  var id: Self { self }

  case banner = "Banner"
  case interstitial = "Interstitial"
  case rewarded = "Rewarded"
  case rewardedInterstitial = "Rewarded Interstitial"

  var contentView: some View {
    return viewForType()
  }
}

extension HomePageItem {
  @ViewBuilder
  private func viewForType() -> some View {
    switch self {
    case .banner:
        BannerContentView(navigationTitle: self.rawValue)
    case .interstitial:
      InterstitialContentView(navigationTitle: self.rawValue)
    case .rewarded:
      RewardedContentView(navigationTitle: self.rawValue)
    case .rewardedInterstitial:
      RewardedInterstitialContentView(navigationTitle: self.rawValue)
    }
  }
}
