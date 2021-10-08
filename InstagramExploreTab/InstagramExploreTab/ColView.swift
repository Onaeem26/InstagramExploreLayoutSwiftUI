//
//  ColView.swift
//  InstagramExploreTab
//
//  Created by Muhammad Osama Naeem on 10/7/21.
//

import SwiftUI

struct CustomGridView: View {
    private var imageURLS = ImageURLStore.imageURLS
    var body: some View {
        let gridItems = [GridItem(.fixed(150), spacing: 2, alignment: .leading),
                         GridItem(.fixed(150), spacing: 2, alignment: .leading),
                         GridItem(.fixed(150), spacing: 2, alignment: .leading)]

        ScrollView {
            ForEach(1..<5) { k in
                LazyVGrid(columns: gridItems, spacing: 2) {
                    ForEach(0..<imageURLS.count - 1) { g in
                        
                        if g == 3 {
                            VStack(spacing: 2) {
                               
                                AsyncImage(
                                    url: URL(string: imageURLS[3])!,
                                    content: { image in
                                            image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 150, height: 150)
                                            .clipped()
                                        },
                                        placeholder: {
                                            ProgressView()
                                    }
                                )
                                
                                AsyncImage(
                                    url: URL(string: imageURLS[3+1])!,
                                    content: { image in
                                            image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 150, height: 150)
                                            .clipped()
                                        },
                                        placeholder: {
                                            ProgressView()
                                    }
                                )
                            }
                        }else if g == 4 {
                            AsyncImage(
                                url: URL(string: imageURLS[g + 1])!,
                                content: { image in
                                        image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 300, height: 300)
                                        .clipped()
                                    },
                                    placeholder: {
                                        ProgressView()
                                }
                            )
                        }else {
                            AsyncImage(
                                url: URL(string: imageURLS[g])!,
                                content: { image in
                                        image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 150)
                                        .clipped()
                                    },
                                    placeholder: {
                                        ProgressView()
                                }
                            )
                        }
                        
                        if g == 4 { Color.clear }
                        
                    }
                }
                .frame(width: 470)
                .padding(.bottom, -6)
            }
        }
    }
}

